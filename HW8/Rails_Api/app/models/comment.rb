class Comment < ApplicationRecord
  belongs_to :author
  belongs_to :article
  has_many :likes, as: :likeable

  validates :body, presence: true, length: { minimum: 5 }

  enum :status, { unpublished: 0, published: 1 }, default: :unpublished

  scope :status_position_comment, ->(status_ps) { where(status: status_ps) }
  scope :get_all_by_sort_desc , -> { order('created_at DESC') }
  scope :get_comment_limit, ->(limit_com = 10) { order('created_at DESC').limit(limit_com) }
end
