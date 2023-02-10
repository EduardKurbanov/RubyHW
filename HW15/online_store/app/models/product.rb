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

  broadcasts_to ->(product) { 'products' }, inserts_by: :prepend
end
