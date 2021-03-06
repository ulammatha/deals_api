require "rails_helper"

RSpec.describe Api::V1::DealsController, type: :routing do
  describe "routing" do
    it { expect(get: "api/v1/deals").
      to route_to("api/v1/deals#index", format: :json) }
    it { expect(get: "api/v1/deals/1").
      to route_to("api/v1/deals#show", id: "1", format: :json) }
    it { expect(post: "api/v1/deals").
      to route_to("api/v1/deals#create", format: :json) }
    it { expect(put: "api/v1/deals/1").
      to route_to("api/v1/deals#update", id: "1", format: :json) }
    it { expect(delete: "api/v1/deals/1").
      to route_to("api/v1/deals#destroy", id: "1", format: :json) }
  end
end