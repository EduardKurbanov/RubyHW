# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  price       :decimal(, )
#  image       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#
class Product < ApplicationRecord
  belongs_to :category
  has_many :line_items, dependent: :nullify
  
  has_one_attached :image do |attachable|
    attachable.variant :little, resize_to_limit: [100, 100]
    attachable.variant :medium, resize_to_limit: [200, 200]
    attachable.variant :main, resize_to_limit: [235, 235]
  end

  validates :name, :description, :price, presence: true

  after_create_commit -> { broadcast_prepend_to 'products', partial: 'products/index_products' }
  after_update_commit -> { broadcast_replace_to 'products', partial: 'products/index_products' }
  after_destroy_commit -> { broadcast_remove_to 'products' }
end
