class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts

  def avg_blogger_age
    avg_sum  = 0
    self.bloggers.each do |blogger|
      avg_sum += blogger.age
      #byebug
    end
    avg = avg_sum /self.bloggers.count
  end

  def fearured_post
    result = self.posts.sort_by {|post| post.likes}
  end

end
  