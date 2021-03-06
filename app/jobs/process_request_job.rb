class ProcessRequestJob < SidekiqJob
  include ::Sidekiq::Status::Worker

  sidekiq_options retry: false, queue: :process_requests

  attr_reader :request_processor

  def initialize(request_processor: ::Jobs::RequestProcessor.new)
    @request_processor = request_processor
  end

  def perform(request_id)
    logger.info "Started with request_id=#{request_id}."
    request = retrieve_request(request_id)
    request_processor.call(request)
    logger.info 'Completed.'
  rescue Exception => e
    request.failure! if request
    raise e
  end

  private

  def retrieve_request(request_id)
    ::Request.find(request_id)
  end
end
