class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts

  def location
    "#{self.name}, #{self.country}"
  end

  def my_recent_posts
    self.posts.sort_by{|p| p.created_at}.first(5)
  end

  def most_popular_post
    self.posts.sort_by{|p| p.post_likes}.reverse.first
  end

  def average_age_of_my_bloggers
    (self.bloggers.map{|u| u.age}.inject(:+).to_f / self.bloggers.size).to_i
  end

  def self.sorted
    Destination.all.sort_by{|d| [d.country, d.name]}
  end
end
