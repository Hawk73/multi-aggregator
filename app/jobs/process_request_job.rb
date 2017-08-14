class ProcessRequestJob < SidekiqJob
  include ::Sidekiq::Status::Worker

  sidekiq_options retry: false, queue: :requests

  def initialize(import_zones_use_case: ::API::Zones::ImportZones.new)
    @import_zones_use_case = import_zones_use_case
  end

  def perform(request_id)
    logger.info "Processing request(ID=#{request_id}) started."
    # TODO:
    logger.info "Request(ID=#{request_id}) completed."
  end

  def expiration
    @expiration ||= Settings.jobs.expiration_time_in_seconds
  end
end
