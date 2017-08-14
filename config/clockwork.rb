require_relative 'boot'
require_relative 'environment'
require 'clockwork'

module Clockwork
  configure do |config|
    logger = ActiveSupport::TaggedLogging.new(Logger.new(STDOUT))
    config[:logger] = logger
  end

  handler do |worker_class|
    manager.config[:logger].tagged("SID-#{SecureRandom.hex(7)}", worker_class) do
      # if worker_class.to_s =~ /Job/
        worker_class.perform_later
      # else
      #   worker_class.new.call
      # end
    end
  end

  every(5.seconds, ::ProcessRequestJob)
end
