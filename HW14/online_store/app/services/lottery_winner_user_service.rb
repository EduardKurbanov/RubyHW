class LotteryWinnerUserService
  attr_reader :class_name

  def initialize(class_name)
    @class_name = class_name
  end

  def call
    date_start = DateTime.now
    date_finish = date_start - 1.month

    paid_orders = Order.where(created_at: date_finish..date_start).paid
    users = paid_orders.map(&:user).uniq.sample(2)

    users.each do |user|
      UserMailer.lottery_winner_user(user).deliver_later
    end
  end
end