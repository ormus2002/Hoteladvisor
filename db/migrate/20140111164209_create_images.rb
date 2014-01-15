class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string  :image_file, null: false
      t.string  :name, null: false
      t.integer :hotel_id, null: false
      t.timestamps
    end
  end
end
