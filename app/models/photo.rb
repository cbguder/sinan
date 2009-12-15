class Photo < ActiveRecord::Base
  belongs_to :building

  validates_presence_of :building_id

  has_attached_file :photo, :styles => { :medium => "600x600>", :thumb => "130x130>" }
  validates_attachment_presence :photo
end
