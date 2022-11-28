class Comment < ApplicationRecord
  belongs_to :author
  belongs_to :article

  validates :body, presence: true, length: { minimum: 5 }

  enum :status, { unpublished: 0, published: 1 }, default: :unpublished
end
