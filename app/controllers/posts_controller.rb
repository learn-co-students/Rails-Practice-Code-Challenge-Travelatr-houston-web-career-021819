class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @post = Post.new
    @bloggers = Blogger.all
    @destinations = Destination.all
  end

  def create
    @post = Post.new(post_params(:title, :content, :blogger_id, :destination_id))
    byebug
    if @post.valid?
      @post.save
      redirect_to post_path(@post)
    else
      @bloggers = Blogger.all
      @destinations = Destination.all
      render :new
    end
  end

  def edit
    @post = Post.new
    @bloggers = Blogger.all
    @destinations = Destination.all
  end

  def update
    @post = Post.assign_attributes(post_params(:title, :content, :blogger_id, :destination_id))
    if @post.valid?
      @post.save
      redirect_to post_path(@post)
    else
      @bloggers = Blogger.all
      @destinations = Destination.all
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def like
    @post = Post.find(params[:id])
    @post.likes = @post.post_likes + 1
    @post.save
    render :show
  end

  private

    def post_params(*args)
      params.require(:post).permit(*args)
    end
end
