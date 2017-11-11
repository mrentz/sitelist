require 'verify_url.rb'

class Site < ApplicationRecord

  validate :verify_url, on: :create
#  validate :verify_url, on: :update
  validates :site, :description, :url, presence: true
  validates :site, :url, uniqueness: true


def verify_url
  if self.url
    self.url = VerifyUrl.check self.url
   end
end

end
