class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:show, :index]
    before_action :req_same_user, only: [ :edit, :update, :destroy]
    def new
        @post= Post.new
    end
    def index
        @posts= Post.paginate(page: params[:page], per_page: 3)
    end
    def show
    end    

    def edit 
    end

    def update
        if @post.update(  post_params )
            skill_match @post , 'update'
            flash[:notice]= 'Your Account Information Updated Scuccesfully'
            redirect_to post_path(@post)
        else
            render 'edit'
        end
    end

    def create
        @post = Post.new(post_params)
        @post.company = current_user
        if @post.save
            skill_match @post , 'create'
            flash[:notice] = "Your Job post is Succesfully created"
            redirect_to posts_path
        else
            render 'new'
        end
    end   
    def destroy
        @post.destroy
        flash[:notice] = "Account and all articles associated are deleted"
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        respond_to do |format|
            format.html { redirect_to posts_path notice: 'Job post is successfully deleted.' }
            format.json { head :no_content }
        end
    end


    private

    def post_params
        params.require(:post).permit(:name, :description, skills: [])
    end
    def set_post
        if Post.where(id: params[:id]).any?
            @post= Post.find(params[:id])
        else 
            flash[:alert]="Job post removed. Reload for updated list"
            redirect_back_or_to '/'
        end
    end
    def req_same_user
        if current_user != @post.company 
            flash[:alert] = "You can only edit or delete your Company posts"
            redirect_to @post
        end
    end
end
