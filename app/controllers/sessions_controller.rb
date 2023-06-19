class SessionsController < ApplicationController
    def new
        if !session[:user1_id].nil?
            flash[:alert] ='You are already logged in'
            redirect_to company_path(current_user)
        elsif !session[:user2_id].nil?
            flash[:alert] ='You are already logged in as Applicant.'
            redirect_to applicant_path(current_user2)
        end
    end
    def create 
        company = Company.find_by(email: params[:session][:email].downcase)
        if company && company.authenticate(params[:session][:password])
            session[:user1_id] = company.id
            flash[:notice]= "Login Successful"
            redirect_to company
        else
            flash.now[:alert]= "Login Failed. Incorrect email or password."
            render 'new'
        end
            
    end
    def destroy
        session[:user1_id] = nil
        session[:user2_id] = nil
        flash[:notice] = "Logged out"
        redirect_to root_path
    end

    def new1
        if !session[:user2_id].nil?
            flash[:alert] ='You are already logged in'
            redirect_to applicant_path(current_user2)
        elsif !session[:user1_id].nil?
            flash[:alert] ='You are already logged in as Company.'
            redirect_to company_path(current_user)
        end  
    end
    def create1       
        applicant = Applicant.find_by(email: params[:session][:email].downcase)
        if applicant && applicant.authenticate(params[:session][:password])
            session[:user2_id] = applicant.id
            flash[:notice]= "Login Successful"
            redirect_to applicant
        else
            flash.now[:alert]= "Login Failed. Incorrect email or password."
            render 'new'
        end
    end
end