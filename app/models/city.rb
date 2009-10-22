class City < ActiveRecord::Base
  has_many :buildings
  has_many :photos, :through => :buildings
end
