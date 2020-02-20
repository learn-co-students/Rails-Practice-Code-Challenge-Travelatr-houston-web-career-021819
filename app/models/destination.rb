class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts


  def featured_post
      featured_post = self.posts[0]
        self.posts.each do |post|
          if post.likes > featured_post.likes
            featured_post = post
          end
        end
        featured_post
  end

  def average_age
    if self.posts[0] != nil
      ages = []
      self.bloggers.uniq.each do |blogger|
        ages << blogger.age
      end
      ages = ages.inject(:+).to_f / self.bloggers.length.to_f
    else
      ages = "This destination has no bloggers."
    end
  end

  def most_recent
    self.posts.last(5)
  end

end
