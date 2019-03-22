class BloggersController < ApplicationController
    def index
        @bloggers = Blogger.all
    end

    def show
        @blogger = Blogger.find(params[:id])
        #sum of likes
        @likes = @blogger.posts.map { | post | post.likes }
        @sum_likes = @likes.inject(0){| sum, x| sum + x }
        #get feature post
        @feature_post = @blogger.posts.max_by(&:likes)

    end

    def new
        @errors = flash[:errors] || {}
        @blogger = Blogger.new
    end

    def create
        @blogger = Blogger.new(blogger_params[:blogger])
        if @blogger.valid?
            @blogger.save
            redirect_to @blogger
        else
            #show error message
            flash[:errors] = @blogger.errors.messages
            render :new
        end
    end

    def edit
        @blogger = Blogger.find(params[:id])
    end

    def update
        @blogger = Blogger.find(params[:id])
        @blogger.assign_attributes(blogger_params[:blogger])
        if @blogger.valid?
            @blogger.save
            redirect_to @blogger
        else
            flash[:errors] = @blogger.errors.messages
            render :edit
        end
    end

    def blogger_params
        params.permit(blogger: [:name, :bio, :age])
    end

end
