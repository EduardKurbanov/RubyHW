class Cart < ApplicationRecord
  has_many :line_items, dependent: :nullify
  has_one :orders

  def add_product(product)
    line_items.create(product: product, quantity: 1, price: product.price)
  end

#  def total_price
#    line_items.map(&:product).sum(&:price)
#  end

  def total_price
    sum = 0
    self.line_items.each do |line_item|
      sum += line_item.price * line_item.quantity
    end
    return sum
  end
end