class PagesController < ApplicationController
    def home 
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
        if !session[:user1_id].nil?
            flash[:alert] ='You are already logged in'
            redirect_to applicants_path
        end
    end
end
