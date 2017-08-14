class ProvidersController < ApplicationController
  prepend_before_filter :require_login!

  def index
    @providers = Provider.paginate(page: params[:page], per_page: 10).order('id DESC')
  end

  def new
    @provider = Provider.new
  end

  def create
    @provider = Provider.new(provider_params)
    @provider.user = current_user

    if @provider.save
      flash[:notice] = 'Provider has been created successfully.'
      redirect_to(@provider)
    else
      render('new')
    end
  end

  def show
    @provider = retrieve_provider
    @request = @provider.requests.new
  end

  def destroy
  end

  def add_request
    @provider = retrieve_provider
    @request = @provider.requests.new(request_params)
    @request.user = current_user

    if @request.save
      flash[:notice] = 'Request has been added successfully.'
      redirect_to(@provider)
    else
      render('show')
    end
  end

  private

  def provider_params
    params.require(:provider).permit(:name, :text, :settings)
  end

  def request_params
    params.require(:request).permit(:text)
  end

  def retrieve_provider
    Provider.find(params[:id])
  end
end
