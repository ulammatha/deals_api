require "rails_helper"

RSpec.describe VendorsController, type: :routing do
  describe "routing" do
    it { expect(get: "/vendors").to route_to("vendors#index") }
    it { expect(get: "/vendors/1").to route_to("vendors#show", id: "1") }
    it { expect(post: "/vendors").to route_to("vendors#create") }
    it { expect(put: "/vendors/1").to route_to("vendors#update", id: "1") }
    it { expect(delete: "/vendors/1").to route_to("vendors#destroy", id: "1") }
  end
end
