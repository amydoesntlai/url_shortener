class ShortenedUrl < ActiveRecord::Base
  attr_accessible :original_url, :new_url, :visit_count
  before_save :shorten

  validates :original_url, :format => { :with => /https?:\/\//, :message => "Please enter a URL in the form 'http://' or 'https://'"}

  def shorten
    suffix = rand(36**5).to_s(36) until ShortenedUrl.find_by_new_url(suffix) == nil
    self.new_url = suffix
  end

end
