class Comment < ApplicationRecord
  acts_as_paranoid
  belongs_to :user
  belongs_to :post

  validates :content, presence: true

  default_scope { order(id :desc) }
  #對model所有查詢都會套用

  def owned_by?(user)
    self.user == user
    # 擁有者
  end
end
