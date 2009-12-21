class City < ActiveRecord::Base
  has_many :buildings

  def find_destination(distance, bearing)
    r = 6371.0 # Earth's mean radius in kilometers

    lat1 = self.latitude * Math::PI / 180.0
    lon1 = self.longitude * Math::PI / 180.0
    bearing = bearing * Math::PI / 180.0

    result = {}
    lat2 = Math.asin(Math.sin(lat1) * Math.cos(distance/r) + Math.cos(lat1) * Math.sin(distance/r) * Math.cos(bearing));
    lon2 = lon1 + Math.atan2(Math.sin(bearing) * Math.sin(distance/r) * Math.cos(lat1), Math.cos(distance/r) - Math.sin(lat1) * Math.sin(lat2));

    return [lat2, lon2].collect {|x| x * 180.0 / Math::PI }
  end
end
