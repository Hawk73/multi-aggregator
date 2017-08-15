class PrepareRequestJob < SidekiqJob
  include ::Sidekiq::Status::Worker

  sidekiq_options retry: false, queue: :prepare_requests

  attr_reader :request_preparer

  def initialize(request_preparer: ::Jobs::RequestPreparer.new)
    @request_preparer = request_preparer
  end

  def perform(request_id)
    logger.info "Started with request_id=#{request_id}."
    request = retrieve_request(request_id)
    request_preparer.call(request)
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
