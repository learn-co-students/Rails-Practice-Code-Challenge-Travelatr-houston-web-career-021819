class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts

  validates :name, presence: true
  validates :age, numericality: {greater_than: 0}
  validates :bio, length: {minimum: 30}

  def post_likes
    likes = 0
    self.posts.map do |post|
      likes += post.likes
    end
    likes
  end

  def featured_post
    featured_post = self.posts[0]
      self.posts.each do |post|
        if post.likes > featured_post.likes
          featured_post = post
        end
      end
      featured_post
  end

  def top_five_dest
    dest_count = {}
      self.destinations.each do |destination|
        dest_count[destination.name] = 0
      end
      self.destinations.each do |destination|
        dest_count[destination.name] += 1
      end
    top_five = []
    until top_five.length == 5 || top_five.length == dest_count.length
          top_five << dest_count.max_by{|k,v|v}[0]
          dest_count[dest_count.max_by{|k,v|v}[0]] = 0
    end
    top_five
  end
  
end
