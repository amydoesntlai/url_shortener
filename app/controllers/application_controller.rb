class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
    log 'whatever----------------------'
    puts @shortened_url
    render @shortened_url.original_url
  end
end
