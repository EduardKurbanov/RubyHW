class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  validates :quantity, numericality: { qreater_than_or_equal_to: 1}
end
