class Article < ApplicationRecord
  has_many :comment, dependent: :destroy
  has_and_belongs_to_many :tags
  belongs_to :author
  has_many :likes, as: :likeable
  
  
  validates :title, presence: true, length: { minimum: 2 }
  validates :body, presence: true, length: { minimum: 5 }

  enum :status, { unpublished: 0, published: 1 }, default: :unpublished

  scope :get_articles_all, -> { order('created_at DESC') }
end
