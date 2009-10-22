class Building < ActiveRecord::Base
  belongs_to :city
  has_many :photos
end
