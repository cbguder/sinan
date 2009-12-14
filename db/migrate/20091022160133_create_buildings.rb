class CreateBuildings < ActiveRecord::Migration
  def self.up
    create_table :buildings do |t|
      t.string :name, :null => false
      t.integer :year, :null => false
      t.integer :city_id, :null => false
      t.text :address, :null => false
      t.text :directions, :null => false
      t.text :description, :null => false
      t.float :latitude, :null => false
      t.float :longitude, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :buildings
  end
end
