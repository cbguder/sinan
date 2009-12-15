class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.integer :building_id, :null => false
      t.string :description, :null => false
      t.date :date, :null => false
      t.boolean :public, :null => false

      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size
    end
  end

  def self.down
    drop_table :photos
  end
end
