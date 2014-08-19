class Post < ActiveRecord::Base
  belongs_to :user

  has_many :likes, :as => :likeable

  validates :content, presence: true
  validates :user, presence: true

  has_many :comments #, :conditions => {:deleted => false}
  has_many :commenters, -> { distinct }, through: :comments, :source => :user

  def liked_by?(user)
    Like.where(user: user, likeable: self).exists?
  end
end
