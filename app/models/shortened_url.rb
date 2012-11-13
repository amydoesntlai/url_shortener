class ShortenedUrl < ActiveRecord::Base
  attr_accessible :original_url, :new_url
  before_save :shorten

  def shorten
    suffix = rand(36**5).to_s(36) until ShortenedUrl.find_by_new_url(suffix) == nil
    self.new_url = suffix
  end

end
