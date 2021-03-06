class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  default_scope -> { order(created_at: :desc) }

  validates :title, presence: true
  validates :body, presence: true
end
