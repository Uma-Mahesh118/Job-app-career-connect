class ConversationsController < ApplicationController
    before_action :req_same_user, only: [:new, :create, :index]
    def new
        if logged_in?
            if Applicant.where(id: params[:applicant_id] )!=[]
                @other = Applicant.find(params[:applicant_id])
                if Conversation.where(applicant_id: params[:applicant_id], company_id: current_user.id)!=[]
                    @conversation = Conversation.find_by(applicant_id: params[:applicant_id], company_id: current_user.id)
                else
                    @conversation = Conversation.create!(applicant_id: params[:applicant_id], company_id: current_user.id)
                end
            else
                flash[:alert]= 'Applicant account got deleted for some unknown reasons.'
                redirect_back_or_to '/'
            end
        elsif logged2_in?
            if Company.where(id: params[:company_id] )!=[]
                @other = Company.find(params[:company_id])
                if Conversation.where(applicant_id: current_user2.id, company_id: params[:company_id])!=[]
                    @conversation = Conversation.find_by(applicant_id: current_user2.id, company_id: params[:company_id])
                else
                    @conversation = Conversation.create!(applicant_id: current_user2.id, company_id: params[:company_id])
                end
            else
                flash[:alert]= 'Company account got deleted for some unknown reasons.'
                redirect_back_or_to '/'
            end
        end
    end
    def index           
        if logged_in? 
            @conversations = Conversation.where(company_id: current_user.id)
        elsif logged2_in? 
            @conversations = Conversation.where(applicant_id: current_user2.id)
        else
            flash[:alert] ='Login before you see conversations'
            redirect_back_or_to '/'
        end
    end
    private 
    def conversation_params
        params.require(:conversation).permit(:company_id, :appllicant_id)
    end
    def req_same_user
        if ( logged_in? && current_user.id != session[:user1_id] ) || (logged2_in? && current_user2.id != session[:user2_id])
            flash[:alert] = "You can only edit or delete your chats"
            redirect_back_or_to '/' 
        elsif (!logged_in? && !logged2_in?)
            flash[:alert] ='Login before you chat'
            redirect_back_or_to '/'
        end
    end
end