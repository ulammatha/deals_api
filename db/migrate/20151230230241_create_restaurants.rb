class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :description
      t.string :phone
      t.string :email
      t.text :address
      t.integer :rating
      t.integer :vendor_id

      t.timestamps null: false
    end
  end
end
