require 'sidekiq-scheduler'

class RandomlyWinnerWorker
  include Sidekiq::Worker

  def perform
    RandomlyWinnerService.new(lottery_winners: 'RandomlyWinner').call
  end
end
