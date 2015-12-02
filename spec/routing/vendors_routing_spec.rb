require "rails_helper"

RSpec.describe Api::V1::VendorsController, type: :routing do
  describe "routing" do
    it { expect(get: "/v1/vendors").
      to route_to("api/v1/vendors#index", format: :json) }
    it { expect(get: "/v1/vendors/1").
      to route_to("api/v1/vendors#show", id: "1", format: :json) }
    it { expect(post: "/v1/vendors").
      to route_to("api/v1/vendors#create", format: :json) }
    it { expect(put: "/v1/vendors/1").
      to route_to("api/v1/vendors#update", id: "1", format: :json) }
    it { expect(delete: "/v1/vendors/1").
      to route_to("api/v1/vendors#destroy", id: "1", format: :json) }
  end
end
