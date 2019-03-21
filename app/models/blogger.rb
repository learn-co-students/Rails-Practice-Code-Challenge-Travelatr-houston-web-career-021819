class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts
    validates :name, uniqueness: true
    validates :age, numericality: { greater_than: 0 }
    validates :bio, length: { minimum: 31 }

    def featured_post
        sorted_posts = self.posts.uniq.sort_by { |post| post.likes }.reverse
        return sorted_posts.first
    end

    def most_written_destinations
        sorted_destinations = self.destinations.uniq.sort_by { |destination| destination.posts.length }.reverse
        return sorted_destinations.first(5)
    end

end
