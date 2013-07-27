class UrlsController < ApplicationController
  before_action :authenticate_user!

  def index
    @urls = Url.all
  end

  def new
    @url = Url.new
    @url.hash_code = SecureRandom.urlsafe_base64(8)
  end

  def create
    safe_url_params = params.require(:url).permit(:link, :hash_code)
    @url = Url.new safe_url_params
    if @url.save
      redirect_to url_path(@url)
    else
      # This line overrides the default rendering behavior, which
      # would have been to render the "create" view.
      render '/home/index'
    end
  end

  def show
    @url = Url.find(params[:id])
    @full_path = "#{request.host_with_port}/#{@url.hash_code}"
  end

  def redirector
    @url = Url.find_by hash_code: params[:some_totally_random_value]
    if @url
      redirect_to @url.link
    else
      redirect_to root_path
    end
  end

  def preview
    @url = Url.find_by hash_code: params[:some_totally_random_value]
    unless @url
      redirect_to root_path
    end
  end

  def destroy
    @url = Url.find(params[:id])
    if @url.present?
      @url.destroy
    end
    flash[:notice] = "The following link has been un-shortened: '#{@url.link}'"
    redirect_to :action => 'index'
  end

end
