class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string  :title, null: false
      t.float   :rating, null: false, default: 0
      t.boolean :is_breakfast, default: false
      t.text    :room_description
      t.decimal :room_price, precision: 8, scale: 2
      t.timestamps
    end

    add_index :hotels, :title, unique: true

  end
end
