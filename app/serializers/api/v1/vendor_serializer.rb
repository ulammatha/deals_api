class Api::V1::VendorSerializer < ActiveModel::Serializer
  attributes :id, :first_name

  def last_name
    binding.pry
    object.first_name + " " + object.last_name
  end
end
