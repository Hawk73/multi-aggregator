class SidekiqJob
  include Sidekiq::Worker

  class << self
    alias_method :perform_later, :perform_async
  end

  delegate :logger, to: 'Rails'
end
