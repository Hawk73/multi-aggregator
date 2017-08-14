class RequestsController < ApplicationController
  prepend_before_filter :require_login!

  def index
    # @requests = ::Request.paginate(page: params[:page], per_page: 10).order('id DESC')
  end

  def new
    # @request = ::Request.new
  end

  def create
    # @request = ::Request.new(request_params)
    # @request.user = current_user
    #
    # if @request.save
    #   flash[:notice] = 'Request has been created successfully.'
    #   redirect_to(@request)
    # else
    #   render('new')
    # end
  end

  def show
    # @request = retrieve_request
  end

  def destroy
  end

  private

  def request_params
    params.require(:request).permit(
      :provider_id,
    )
  end

  def retrieve_request
   ::Request.find(params[:id])
  end
end
