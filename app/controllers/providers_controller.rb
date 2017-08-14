class ProvidersController < ApplicationController
  prepend_before_filter :require_login!

  def index
    @providers = ::Provider.paginate(page: params[:page], per_page: 10).order('id DESC')
  end

  def new
    @provider = ::Provider.new
    @provider.settings ||= {}
  end

  def create
    @provider = ::Provider.new(provider_params)
    @provider.user = current_user
    @provider.settings = retrieve_provider_settings

    if @provider.save
      flash[:notice] = 'Provider has been created successfully.'
      redirect_to(@provider)
    else
      render('new')
    end
  end

  def show
    @provider = retrieve_provider
  end

  def destroy
  end

  private

  def provider_params
    params.require(:provider).permit(
      :adapter_type,
      :name,
    )
  end

  def retrieve_provider
   ::Provider.find(params[:id])
  end

  def retrieve_provider_settings
      ActiveSupport::JSON.decode(params[:provider][:raw_settings])
  # TODO: cut the bad code
  rescue
    {}
  end
end
