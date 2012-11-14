class ShortenedUrlsController < ApplicationController
  def new
    @shortened_url = ShortenedUrl.new

    respond_to do |format|
      format.html
    end
  end

  def create
    @shortened_url = ShortenedUrl.new(params[:shortened_url])

    respond_to do |format|
      if @shortened_url.save
        format.html { redirect_to @shortened_url }
      else
        format.html { render :action => 'new' }
      end
    end
  end

  def show
    @shortened_url = ShortenedUrl.find(params[:id])
  end

  def original
    @shortened_url = ShortenedUrl.find_by_new_url(params[:new_url])
    redirect_to @shortened_url.original_url
    @shortened_url.increment!(:visit_count)
  end

  def index
  end

end
