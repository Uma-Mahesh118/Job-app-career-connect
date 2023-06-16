class PagesController < ApplicationController
    def home 
        if logged_in?
            redirect_to company_path(current_user)
        elsif logged2_in?
            redirect_to applicant_path(current_user2)
        end
    end
    def about 
    end
    def new
    end
    def type
        if !session[:user1_id].nil? 
            flash[:alert] ='You are already logged in'
            redirect_to companies_path
        end
    end
    def type1
        if !session[:user2_id].nil?
            flash[:alert] ='You are already logged in'
            redirect_to applicants_path
        end
    end
end
