class SessionsController < ApplicationController
    def new
    end
    def create 
        company = Company.find_by(email: params[:session][:email].downcase)
        if company && company.authenticate(params[:session][:password])
            session[:user_id] = company.id
            flash[:notice]= "Login Successful"
            redirect_to company
        else
            flash.now[:alert]= "Login Failed. Incorrect email or password."
            render 'new'
        end
    end
    def destroy
        session[:user_id] = nil
        flash[:notice] = "Logged out"
        redirect_to root_path
    end
end