class Api::V1::VendorSerializer < ActiveModel::Serializer
  attributes :id, :last_name, :phone

  def last_name
    object.first_name + " " + object.last_name
  end
end
