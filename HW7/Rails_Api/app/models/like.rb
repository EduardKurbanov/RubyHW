class Like < ApplicationRecord
  belongs_to :author
  belongs_to :likeable, polymorphic: true
end
