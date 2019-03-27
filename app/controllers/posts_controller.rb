class PostsController < ApplicationController
    def index
        @posts = Post.all
    end
    def show
        @bloggers = Blogger.all
        @destinations = Destination.all
        @post = Post.find(params[:id])
    end
    def new
        @errors = flash[:errors] || {}
        @post = Post.new
    end
    def create
        @post = Post.new(post_params[:post])
        if @post.valid?
            @post.save
            redirect_to @post
        else
            #show error message
            flash[:errors] = @post.errors.messages
            render :new
        end
    end
    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        @post.assign_attributes(post_params[:post])
        if @post.valid?
            @post.save
            redirect_to @post
        else
            flash[:errors] = @post.errors.messages
            render :edit
        end
    end

    def destroy
        Post.find(params[:id]).destroy
        redirect_to posts_path
    end
    
    def add_likes
        @post = Post.find(params[:id])
        @post.likes ||= 0  #set up default value for new post as 0
        @post.likes += 1
        @post.save
        redirect_to @post
    end
    
    def post_params
        params.permit(post: [:title, :content, :likes, :blogger_id, :destination_id])
    end
end
