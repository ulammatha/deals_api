require 'rails_helper'

RSpec.describe Api::V1::RestaurantsController, type: :controller do

  let!(:restaurant) {create(:restaurant)}


  describe "GET #index" do
    it "assigns all restaurants as @restaurants" do
      get :index, { format: :json }
      expect(assigns(:restaurants)).to eq([restaurant])
    end
  end

  describe "GET #show" do
    it "assigns the requested restaurant as @restaurant" do
      get :show, { id: restaurant.id, format: :json }
      expect(assigns(:restaurant)).to eq(restaurant)
    end
  end

  describe "POST #create" do
    let(:valid_attributes) { attributes_for(:restaurant) }
    let(:invalid_attributes) { attributes_for(:restaurant, name: nil) }
    context "with valid params" do
      it "creates a new restaurant" do
        expect {
          post :create, { restaurant: valid_attributes, format: :json }
        }.to change(Restaurant, :count).by(1)
      end

      it "assigns a newly created restaurant as @restaurant" do
        post :create, { restaurant: valid_attributes, format: :json }
        expect(assigns(:restaurant)).to be_a(Restaurant)
        expect(assigns(:restaurant)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved restaurant as @restaurant" do
        # post :create, {:vendor => invalid_attributes}, valid_session
        post :create, { restaurant: invalid_attributes, format: :json }
        expect(assigns(:restaurant)).to be_a_new(Restaurant)
      end

      it "returns unprocessable_entity status " do
        # post :create, {:vendor => invalid_attributes}, valid_session
        post :create, { restaurant: invalid_attributes, format: :json }
        expect(response.status).to eq(422)
      end
    end
  end


  describe "PUT #update" do
    let(:new_attributes) do
      attributes_for(:restaurant,
        name: "new_restaurant_name",
        phone: "7779998888"
      )
    end

    let(:new_invalid_attributes) do
      attributes_for(:restaurant,
        name: "",
        phone: ""
      )
    end

    context "with valid params" do
      it "updates the requested restaurant" do
        # put :update, {:id => vendor.to_param, :vendor => new_attributes}, valid_session
        put :update, {:id => restaurant.id, restaurant: new_attributes, format: :json}
        restaurant.reload
        expect(restaurant.name).to eq("new_restaurant_name")
        expect(restaurant.phone).to eq("7779998888")
      end

      it "assigns the requested restaurant as @restaurant" do
        # put :update, {:id => vendor.to_param, :vendor => valid_attributes}, valid_session
        put :update, {id: restaurant.id, restaurant: new_attributes, format: :json}
        expect(assigns(:restaurant)).to eq(restaurant)
      end
    end

    context "with invalid params" do
      it "assigns the restaurant as @restaurant" do
        # put :update, {:id => vendor.to_param, :vendor => invalid_attributes}, valid_session
        put :update, {id: restaurant.id, restaurant: new_invalid_attributes, format: :json }
        expect(assigns(:restaurant)).to eq(restaurant)
      end

      it "returns unprocessable_entity status" do
        # put :update, {:id => vendor.to_param, :vendor => invalid_attributes}, valid_session
        put :update, {id: restaurant.id, restaurant: new_invalid_attributes, format: :json}
        expect(response.status).to eq(422)
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:restaurant) {create(:restaurant)}
    it "destroys the requested restaurant" do
      # expect {
      #   delete :destroy, {:id => vendor.to_param}, valid_session
      # }.to change(Vendor, :count).by(-1)
      expect {
        delete :destroy, { id: restaurant.id, format: :json }
      }.to change(Restaurant, :count).by(-1)
    end

    it "redirects to the restaurant list" do
      # delete :destroy, {:id => vendor.to_param}, valid_session
      delete :destroy, { id: restaurant.id, format: :json}
      expect(response.status).to eq(204)
    end
  end

end
