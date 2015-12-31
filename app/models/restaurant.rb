class Restaurant < ActiveRecord::Base
  belongs_to :vendor

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :phone
  validates_presence_of :email
  validates_presence_of :address
end
