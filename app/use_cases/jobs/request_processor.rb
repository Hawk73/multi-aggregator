class Jobs::RequestProcessor
  def call(request)
    # TODO: implement
    request.process!
    request.complete!
  end
end
