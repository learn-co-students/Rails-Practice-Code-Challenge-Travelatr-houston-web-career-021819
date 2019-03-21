class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def featured_post
        sorted_posts = self.posts.uniq.sort_by { |post| post.likes }.reverse
        return sorted_posts.first
    end

    def average_blogger_age
        unique_bloggers = self.bloggers.uniq
        blogger_ages = []

        unique_bloggers.each do |blogger|
            blogger_ages << blogger.age
        end
        
        sum = blogger_ages.reduce(:+)
        return sum/unique_bloggers.length
    end

    def readable_name
        return "#{self.name}, #{self.country}"
    end
end
