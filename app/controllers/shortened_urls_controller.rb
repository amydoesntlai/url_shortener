class ShortenedUrlsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @shortened_url = @user.shortened_urls.build(params[:shortened_url])

    respond_to do |format|
      if @shortened_url.save
        format.html { redirect_to @shortened_url.user }
      else
        format.html { render 'users/show' }
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

end
