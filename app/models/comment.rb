class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :content, presence: true

  def owned_by?(user)
    self.user == user
    # 擁有者
  end
end
