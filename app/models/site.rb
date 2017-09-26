require 'net/http'
require 'verify_url.rb'

class Site < ApplicationRecord

  validates :site, :description, :url, presence: true
  validates :site, :url, uniqueness: true

  validate :verify_url, on: :create
  # w= VerifyUrl.check("ggghfjy.com")
#  p "ppppppppppppppppppppppppppppppppppp #{@url}"
  
#  before_save :parse_url
#  before_save :verify_url

def parse_url
  if self.url
    self.url = Domainatrix.parse(self.url).url
  end
end

def verify_url
  if self.url
    self.url = VerifyUrl.check self.url
  end
end

end
