class UsersController < ApplicationController

  before_filter :load_user

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user }
      else
        format.html { render :action => 'new' }
      end
    end
  end

  def show
    @user = User.includes(:shortened_urls).find(params[:id])
    @shortened_url = ShortenedUrl.new
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

  def index
    @users = User.all
  end

  private

  def load_user
    @user = User.find(params[:id]) if params[:id]
  end

end
