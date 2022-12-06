class Comment < ApplicationRecord
  belongs_to :author
  belongs_to :article
  has_many :likes, as: :likeable

  validates :body, presence: true, length: { minimum: 5 }

  enum :status, { unpublished: 0, published: 1 }, default: :unpublished

  scope :get_comments_all, -> { order('created_at ASC') }
end
