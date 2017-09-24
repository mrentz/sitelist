require 'net/http'

class Site < ApplicationRecord

  validates :site, :description, :url, presence: true
  validates :site, :url, uniqueness: true

before_save :parse_url

def parse_url
  if self.url
    self.url = Domainatrix.parse(self.url).url
  end
end

def url_valid
http = Net::HTTP.new(self.url)
response = http.request_get('/')
p response.code  
end

end
