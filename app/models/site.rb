class Site < ApplicationRecord

  validates :site, :description, :url, presence: true
  validates :site, :url, uniqueness: true

end
