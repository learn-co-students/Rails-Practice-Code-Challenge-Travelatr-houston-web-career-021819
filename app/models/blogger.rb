class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts

  validates :name, uniqueness: true
  validates :age, numericality: {greater_than: 0}
  validates :bio, length: {minimum: 30}

  def featured_post
    self.posts.sort_by{|p| p.post_likes}.reverse.first
  end

  def frequency
    self.inject(Hash.new(0)) { |h, e| h[e] += 1 ; h }
  end

  def most_written_about_destinations
    self.posts.map{|p| p.destination.location}.inject(Hash.new(0)) { |h, e| h[e] += 1; h}.sort_by{|k,v| v}.reverse.first(5)
  end

end
