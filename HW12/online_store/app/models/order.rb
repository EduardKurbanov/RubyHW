# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  cart_id    :bigint           not null
#  user_id    :bigint           not null
#  status     :integer          default("unpaid")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#  email      :string
#  address    :text
#
class Order < ApplicationRecord
  belongs_to :cart
  belongs_to :user

  enum :status, { unpaid: 0, paid: 1 }, default: :unpaid
end
