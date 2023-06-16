class MessagesController < ApplicationController
    def index
        if params[:conversation_id].nil? && session[:conv_id].nil?
            flash[:alert]= 'No active Conversations'
            redirect_back_or_to '/'
        elsif session[:conv_id].nil? || !params[:conversation_id].nil?
            session[:conv_id]= params[:conversation_id] 
        end
        @conversation = Conversation.find(session[:conv_id])            
        if logged_in? && @conversation.company_id != current_user.id
            flash[:alert] = "You can only edit or delete your chats"
            redirect_back_or_to '/' 
        elsif logged2_in? && @conversation.applicant_id != current_user2.id
            flash[:alert] = "You can only edit or delete your chats"
            redirect_back_or_to '/' 
        elsif (!logged_in? && !logged2_in?)
            flash[:alert] ='Login before you chat'
            redirect_back_or_to '/'
        end
        @messages = @conversation.messages
        @message = Message.new
    end
    def new
        @message = Message.new
    end
    def create
        @message = Message.new(message_params)
        if @message.save!
            redirect_to messages_path
        end
    end
    private
    def message_params
        params.require(:message).permit(:msg, :conversation_id, :flag)
    end
end