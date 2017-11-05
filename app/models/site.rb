require 'verify_url.rb'

class Site < ApplicationRecord

  validates :site, :description, :url, presence: true
  validates :site, :url, uniqueness: true

  validate :verify_url, on: :create
  validate :verify_url, on: :update

def verify_url
  if self.url
    self.url = VerifyUrl.check self.url
   end
end

end
