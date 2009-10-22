class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.integer :building_id
      t.date :date_taken
      t.boolean :public
    end
  end

  def self.down
    drop_table :photos
  end
end
