class CompaniesController < ApplicationController
    before_action :set_company, only: [:show, :edit, :update, :destroy]
    before_action :require_user, only: [:edit, :update]
    before_action :req_same_company, only: [:edit, :update, :delete]
    def new
        @company= Company.new
    end
    def index
        @companies= Company.paginate(page: params[:page], per_page: 3)
    end
    def show
        @posts = Company.find(params[:id]).posts
    end    

    def edit 
    end

    def update
        if @company.update( company_params )
            flash[:notice]= 'Your Account Information Updated Scuccesfully'
            redirect_to company_path(@company)
        else
            flash[:alert]= "You can only edit your company profile"
            render 'edit'
        end
    end

    def create
        @company = Company.new(company_params)
        if @company.save
            #NotificationMailer.create_action(@company).deliver_now
            session[:user1_id] = @company.id
            flash[:notice] = "Welcome to Catalogue Ally #{@company.name}, you have succesfully signed up"
            redirect_to @company
        else
            render 'new'
        end
    end  
    def destroy
        @company = Company.find(params[:id])        
        session[:user1_id] =nil if @company == current_user
        #NotificationMailer.delete_action(@company) 
        @company.destroy
        respond_to do |format|
            format.html { redirect_to companies_path notice: 'Account is successfully deleted.' }
            format.json { head :no_content }
        end
    end


    private

    def company_params
        params.require(:company).permit(:name, :email, :password)
    end
    def set_company
        @company= Company.find(params[:id])
    end
    def req_same_company
        if current_user != @company 
            flash[:alert] = "You can only edit your Company profile"
            redirect_to @company
        end
    end

end
