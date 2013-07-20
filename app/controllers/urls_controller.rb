class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end

  def new
  end

  def create
    @url = Url.new(params[:id])
    if @url.save
      redirect_to @url
    else
      # This line overrides the default rendering behavior, which
      # would have been to render the "create" view.
      render 'new'
    end
  end

  def show
  end

  def update
  end

  def destroy
  end
end
