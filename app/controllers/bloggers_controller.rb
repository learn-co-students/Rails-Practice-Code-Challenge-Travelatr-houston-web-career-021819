class BloggersController < ApplicationController
    def index
        @bloggers = Blogger.all
    end

    def show  
        @blogger = Blogger.find(params[:id])
        @feature_post = @blogger.posts.sort_by {|post| post.likes}.last
        hash = {}
        @blogger.posts.each do |post|
            key = post.destination.name
            #byebug
            if !hash["#{key}"]
                hash["#{key}"] = 0
            else
                hash["#{key}"] += 1
            end
        
           end
        @top_destinations = hash.keys.sort.each {|key| hash[key]}.reverse
        #byebug  
    end   



    def new
        @blogger = Blogger.new
    end 

    def create 
        @blogger = Blogger.new(blogger_params)
        #byebug
       if @blogger.valid?
          @blogger.save
          redirect_to bloggers_path
       else 
         render 'new' 
       end
    end

    def blogger_params
        params.require(:blogger).permit(:name, :age, :bio)
    end
end