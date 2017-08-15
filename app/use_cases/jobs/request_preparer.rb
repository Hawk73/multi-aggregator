class Jobs::RequestPreparer
  def call(request)
    # TODO: implement preparing

    request.prepared!
    enqueue_processing(request)
  end

  private

  def enqueue_processing(request)
    ::ProcessRequestJob.perform_later(request.id)
  end
end
