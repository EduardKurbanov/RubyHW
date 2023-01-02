class Order < ApplicationRecord
  belongs_to :cart
  belongs_to :user

  enum status: { notpaid: 0, paid: 1 }
end
