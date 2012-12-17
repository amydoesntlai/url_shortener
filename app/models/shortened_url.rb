class ShortenedUrl < ActiveRecord::Base

  belongs_to :user

  attr_accessible :original_url, :new_url, :visit_count, :user_id
  before_validation :shorten

  validates :original_url, :format => { :with => /https?:\/\//, :message => "Please enter a URL in the form 'http://' or 'https://'"}
  validates :new_url, :presence => true, :uniqueness => true
  validates :user, :presence => true

  private

  def shorten
    if self.new_url == ""
      generate_random
    end
  end

  def generate_random
    suffix = rand(36**5).to_s(36)
    while ShortenedUrl.find_by_new_url(suffix) != nil
      suffix = rand(36**5).to_s(36)
    end
    self.new_url = suffix
  end

end
