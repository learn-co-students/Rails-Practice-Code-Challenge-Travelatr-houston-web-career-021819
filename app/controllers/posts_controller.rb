class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)  
        if @post.valid?
           @post.save(post_params)
           redirect_to posts_path
        else
           render 'new'
        end
    
    end


    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
       if @post.valid?
          @post.update(post_params)
          redirect_to @post
       else
        render 'edit'
       end
    end
  
    def add_like
        @post = Post.find(params[:id])
        @post.likes += 1
        @post.save  
        #byebug
        redirect_to @post
    end

    def post_params
        params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
    end
end  