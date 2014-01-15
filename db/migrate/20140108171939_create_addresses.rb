class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string  :country
      t.string  :state
      t.string  :city
      t.string  :street
      t.integer :hotel_id, null: false
      t.timestamps
    end
  end
end
