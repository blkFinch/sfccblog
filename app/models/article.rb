class Article < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: {maixmum: 200},
                                    uniqueness: true

  validates :author, presence: true, length: {maximum: 60}

  validates :body, presence: true
end
