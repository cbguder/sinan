class CreateCities < ActiveRecord::Migration
  def self.up
    create_table :cities do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
    end
  end

  def self.down
    drop_table :cities
  end
end
