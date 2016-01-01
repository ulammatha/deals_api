class Restaurant < ActiveRecord::Base
  belongs_to :vendor
  has_many :deals
  has_attached_file :image,
    styles: { medium: "300x300>"}
  do_not_validate_attachment_file_type :image

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :phone
  validates_presence_of :email
  validates_presence_of :address
  validates_presence_of :image
end
