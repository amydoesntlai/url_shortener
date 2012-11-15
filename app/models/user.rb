class User < ActiveRecord::Base
  has_many :shortened_urls, dependent: :destroy
  attr_accessible :name
  validates :name, :uniqueness => true
end
