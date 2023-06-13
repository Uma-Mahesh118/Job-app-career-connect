class ApplicantsController < ApplicationController
    before_action :set_applicant, only: [:show, :edit, :update, :destroy]
    before_action :require_user2, only: [:edit, :update]
    before_action :req_same_applicant, only: [:edit, :update, :delete]
    def new
        @applicant= Applicant.new
    end
    def index
        @applicants= Applicant.paginate(page: params[:page], per_page: 3)
    end
    def show
    end    

    def edit 
    end

    def update
        if @applicant.update( applicant_params )
            flash[:notice]= 'Your User profile Information Updated Scuccesfully'
            redirect_to applicant_path(@applicant)
        else
            flash[:alert]= "You can only edit your company profile"
            render 'edit'
        end
    end

    def create
        @applicant = Applicant.new(applicant_params)
        if @applicant.save
            session[:user2_id] = @applicant.id
            flash[:notice] = "Welcome to Catalogue Ally #{@applicant.name}, you have succesfully signed up"
            redirect_to @applicant
        else
            render 'new'
        end
    end  
    def destroy
        @applicant = Applicant.find(params[:id])        
        session[:user2_id] =nil if @applicant == current_user
        @applicant.destroy
        respond_to do |format|
            format.html { redirect_to applicants_path notice: 'User Account is successfully deleted.' }
            format.json { head :no_content }
        end
    end

    private

    def applicant_params
        params.require(:applicant).permit(:name, :email, :password, skills: [])
    end
    def set_applicant
        @applicant= Applicant.find(params[:id])
    end
    def req_same_applicant
        if current_user2 != @applicant 
            flash[:alert] = "You can only edit your Company profile"
            redirect_to @applicant
        end
    end

end
