class Tag < ApplicationRecord
  has_and_belongs_to_many :articles

  scope :get_tags_all, -> { order('created_at DESC') }
end
