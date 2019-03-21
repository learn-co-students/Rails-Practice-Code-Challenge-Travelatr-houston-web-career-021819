class BloggersController < ApplicationController
  def new
    @blogger = Blogger.new
  end

  def create
    @blogger = Blogger.new(blogger_params(:name, :bio, :age))
    if @blogger.valid?
      @blogger.save
      redirect_to blogger_path(@blogger)
    else
      render :new
    end
  end

  def show
    #byebug
    @blogger = Blogger.find(params[:id])
    @my_posts = @blogger.posts
  end

  private

    def blogger_params(*args)
      params.require(:blogger).permit(*args)
    end
end
