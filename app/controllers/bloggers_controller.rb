class BloggersController < ApplicationController

  def new
  end

  def show
    @blogger = Blogger.find(params[:id])
  end

  def create
    @blogger = Blogger.new(blogger_params)
    @blogger.posts = []
    if @blogger.save
      redirect_to blogger_path(@blogger)
    else
      render :new
    end
  end

  private

  def blogger_params
    params.require(:blogger).permit(:name, :bio, :age)
  end


end
