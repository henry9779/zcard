class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :content, presence: true

  default_scope { where(deleted_at:nil) }
  #對model所有查詢都會套用

  def destroy #假刪除定義改成
    update(deleted_at)
  end

  def owned_by?(user)
    self.user == user
    # 擁有者
  end
end
