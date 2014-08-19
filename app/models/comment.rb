class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  has_many :likes, :as => :likeable

  validates :content, presence: true
  validates :user, presence: true
  validates :post, presence: true
end
