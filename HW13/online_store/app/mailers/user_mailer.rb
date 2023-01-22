class UserMailer < ApplicationMailer

  def order(user, order)
    @order = order
    @line_items = order.cart.line_items.includes(:product)
    mail(to: user.email, subject: 'Your order')
  end

  def welcome_message(user)
    @user = user
    mail(to: @user.email, subject: 'New account information')
  end
end
