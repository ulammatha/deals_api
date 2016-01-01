class Deal < ActiveRecord::Base
  belongs_to :restaurant
  has_attached_file :image,
    styles: { medium: "300x300>"}
  do_not_validate_attachment_file_type :image

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :current_amount
  validates_presence_of :previous_amount
  validates_presence_of :expiry
  validates_presence_of :available_coupons
  validates_presence_of :sold_coupons
  validates_presence_of :image
end
