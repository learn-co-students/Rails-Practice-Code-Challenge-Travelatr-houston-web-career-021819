class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.all 
  end

  def show
  end

  def new
    @bloggers = Blogger.all 
    @destinations = Destination.all 
  end

  def create
    @post = Post.new(post_params(:title, :content, :likes, :blogger_id, :destination_id))
    @post.likes = 0
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
    @bloggers = Blogger.all 
    @destinations = Destination.all 
  end

  def update
    if @post.update(post_params(:title, :content, :likes, :blogger_id, :destination_id))
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

    private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params(*args)
    params.require(:post).permit(*args)
  end
end
