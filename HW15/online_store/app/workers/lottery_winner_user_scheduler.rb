require 'sidekiq-scheduler'

class LotteryWinnerUserScheduler
  include Sidekiq::Worker

  def perform
    LotteryWinnerUserService.new(class_name: 'LotteryWinnerUser').call
  end
end