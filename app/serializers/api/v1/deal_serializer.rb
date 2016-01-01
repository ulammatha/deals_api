class Api::V1::DealSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :name,
    :description,
    :current_amount,
    :previous_amount,
    :expiry,
    :available_coupons,
    :sold_coupons,
    :image
  )
end
