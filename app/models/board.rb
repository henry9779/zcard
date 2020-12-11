class Board < ApplicationRecord
  validates :title, presence: true
  acts_as_paranoid
  has_many :posts
  belongs_to :user, optional: true
  #option可有可無
end
