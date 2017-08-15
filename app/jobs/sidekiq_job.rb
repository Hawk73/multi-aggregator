class SidekiqJob
  include Sidekiq::Worker

  class << self
    alias_method :perform_later, :perform_async
  end

  delegate :logger, to: 'Rails'

  def expiration
    @expiration ||= Settings.jobs.expiration_time_in_seconds
  end
end
