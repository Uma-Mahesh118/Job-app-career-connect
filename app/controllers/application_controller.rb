class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :logged2_in?, :current_user2, :skill_match
    def current_user
        @current_user ||= Company.find(session[:user1_id]) if session[:user1_id]
    end
    def current_user2
        @current_user2 ||= Applicant.find(session[:user2_id]) if session[:user2_id]
    end
    def logged_in?
        !!current_user
    end
    def logged2_in?
        !!current_user2
    end
    def require_user
        if !logged_in? && logged2_in?
            flash[:alert] = "You must be logged in as an company to do this action"
            redirect_back_or_to '/'
        elsif !logged_in?
            flash[:alert] = "You must be logged to do this action"
            redirect_to login_path
        end

    end
    def require_user2
        if !logged2_in? && logged_in?
            flash[:alert] = "You must be logged in as an company to do this action"
            redirect_back_or_to '/'
        elsif !logged2_in?
            flash[:alert] = "You must be logged to do this action"
            redirect_to login2_path
        end
    end
    def skill_match( post , type)
        result = Result.all
        if !session[:user1_id].nil?
            skills= post.skills 
            Applicant.all.each do |applicant|
                curr_skills = applicant.skills 
                intersection = skills & curr_skills
                n= intersection.size
                m= skills.size 
                if ( (n-1) * 100)/(m-1)  >= 80
                    if !result.where(post_id: post.id,applicant_id: applicant.id).any?
                        res= Result.new(post_id: post.id,applicant_id: applicant.id, matches: n-1)
                        res.save          
                        NotificationMailer.update_action(applicant).deliver_now    
                    end                    
                else
                    if result.where(post_id: post.id,applicant_id: applicant.id).any?
                        Result.where(post_id: post.id,applicant_id: applicant.id).first.destroy
                    end
                end   
            end
        elsif !session[:user2_id].nil?
            applicant= current_user2
            curr_skills = applicant.skills
            Post.all.each do |new_post|
                skills = new_post.skills 
                intersection = skills & curr_skills
                n= intersection.size
                m= skills.size 
                if ( (n-1) * 100)/(m-1) >= 80    
                    if !result.where(post_id: new_post.id,applicant_id: applicant.id ).any?
                        res = Result.new(post_id: new_post.id,applicant_id: applicant.id, matches:n-1 )                  
                        res.save
                        NotificationMailer.update_action(current_user2).deliver_now 
                    end
                else
                    if result.where(post_id: new_post.id,applicant_id: applicant.id).any?
                        Result.where(post_id: new_post.id,applicant_id: applicant.id).first.destroy
                    end
                end  
            end
        end
    end
end
