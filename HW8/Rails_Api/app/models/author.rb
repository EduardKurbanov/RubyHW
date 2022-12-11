class Author < ApplicationRecord
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes

  validates :name, presence: true, length: { minimum: 2 }
end
