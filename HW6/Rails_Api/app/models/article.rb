class Article < ApplicationRecord
  has_many :comment, dependent: :destroy
  belongs_to :author
  
  validates :title, presence: true, length: { minimum: 2 }
  validates :body, presence: true, length: { minimum: 5 }

  scope :comment_status_all, -> { where(status: { unpublished: 0, published: 1 }) }
end
