class Post < ApplicationRecord
  belongs_to :blogger
  belongs_to :destination

  validates :title, presence: true
  validates :content, length: {minimum: 100}

  def post_likes
    self.likes ? self.likes : 0
  end

  def title_and_likes
    "#{self.title}, #{self.post_likes} likes"
  end
end
