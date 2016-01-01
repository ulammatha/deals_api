class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.string :name
      t.text :description
      t.decimal  :current_amount,     precision: 8, scale: 2
      t.decimal  :previous_amount,    precision: 8, scale: 2
      t.datetime :expiry
      t.integer  :available_coupons
      t.integer  :sold_coupons,                               default: 0
      t.integer  :restaurant_id
      t.attachment :image

      t.timestamps null: false
    end
  end
end


    # t.string   "image_file_name"
    # t.string   "image_content_type"
    # t.integer  "image_file_size"
    # t.datetime "image_updated_at"