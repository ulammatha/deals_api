class Api::V1::VendorSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :phone, :email

  def full_name
    object.first_name + " " + object.last_name
  end
end
