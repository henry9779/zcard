class Post < ApplicationRecord
  acts_as_paranoid
  belongs_to :board
  belongs_to :user

  has_many :comments

  has_many :favorite_posts
  has_many :favorite_users, through: :favorite_posts, source :user
  # 透過 favorit_post model,找user model

  validates :title, presence: true
  validates :content, presence: true

  extend FriendlyId
  friendly_id :title, use: :slugged

  def owned_by?(user)
    self.user == user
    # 擁有者
  end
end
