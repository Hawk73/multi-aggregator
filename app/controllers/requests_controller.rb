class RequestsController < ApplicationController
  prepend_before_filter :require_login!

  def index
    @requests = ::Request.paginate(page: params[:page], per_page: 10).order('id DESC')
  end

  def new
    @request = ::Request.new
  end

  def create
    @request = ::Request.new(request_params)
    @request.user = current_user

    @request.save!
    flash[:notice] = 'Request has been created successfully.'

    # TODO: run in additional action
    prepare!

    redirect_to(@request)
  rescue ::ActiveRecord::RecordInvalid
    render('new')
  end

  def show
    @request = retrieve_request
  end

  def destroy
  end

  private

  def request_params
    params.require(:request).permit(
      :name,
      :text
    )
  end

  def retrieve_request
    ::Request.find(params[:id])
  end

  def prepare!
    @request.prepare!
    enqueue_preparing
  end

  def enqueue_preparing
    ::PrepareRequestJob.perform_later(@request.id)
  end
end
