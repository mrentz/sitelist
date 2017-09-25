require 'net/http'
#require 'verify_url.rb'

class Site < ApplicationRecord

  validates :site, :description, :url, presence: true
  validates :site, :url, uniqueness: true

# w= VerifyUrl.check("ggghfjy.com")
#  p "ppppppppppppppppppppppppppppppppppp #{@url}"
  
  before_save :parse_url

def parse_url
  if self.url
    self.url = Domainatrix.parse(self.url).url
  end
end

end
