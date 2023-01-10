class Cart < ApplicationRecord
  has_many :line_items, dependent: :nullify
  has_one :orders

  def total_price
    line_items.map(&:total_price).sum
  end
end