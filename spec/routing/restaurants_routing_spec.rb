require "rails_helper"

RSpec.describe Api::V1::RestaurantsController, type: :routing do
  describe "routing" do
    it { expect(get: "/v1/restaurants").
      to route_to("api/v1/restaurants#index", format: :json) }
    it { expect(get: "/v1/restaurants/1").
      to route_to("api/v1/restaurants#show", id: "1", format: :json) }
    it { expect(post: "/v1/restaurants").
      to route_to("api/v1/restaurants#create", format: :json) }
    it { expect(put: "/v1/restaurants/1").
      to route_to("api/v1/restaurants#update", id: "1", format: :json) }
    it { expect(delete: "/v1/restaurants/1").
      to route_to("api/v1/restaurants#destroy", id: "1", format: :json) }
  end
end