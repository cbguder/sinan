class Building < ActiveRecord::Base
  belongs_to :city
  has_many :photos

  validates_presence_of :name
  validates_numericality_of :year
  validates_numericality_of :latitude
  validates_numericality_of :longitude

  def distance_to(pos)
    # Spherical Law of Cosines

    r = 6371.0 # Earth's mean radius in kilometers

    lat1 = self.latitude * Math::PI / 180.0
    lat2 = pos.latitude * Math::PI / 180.0
    lon1 = self.longitude * Math::PI / 180.0
    lon2 = pos.longitude * Math::PI / 180.0

    Math.acos(Math.sin(lat1) * Math.sin(lat2) + Math.cos(lat1) * Math.cos(lat2) * Math.cos(lon2-lon1)) * r
  end
end
