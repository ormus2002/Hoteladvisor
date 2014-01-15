class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text    :text,     null: false
      t.integer :rating,   null: false
      t.integer :hotel_id, null: false
      t.timestamps
    end
  end
end
