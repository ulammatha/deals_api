class Api::V1::RestaurantSerializer < ActiveModel::Serializer
  has_many :deals, serializer: Api::V1::DealSerializer
  # embed :ids, include: true
  attributes(
    :id,
    :name,
    :description,
    :phone,
    :email,
    :address,
    :rating,
    :image
  )
end
