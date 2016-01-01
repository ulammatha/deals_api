require 'rails_helper'


RSpec.describe Api::V1::DealsController, type: :controller do

   let!(:deal) {create(:deal)}

  describe "GET #index" do
    it "assigns all deals as @deals" do
      get :index, { format: :json }
      expect(assigns(:deals)).to eq([deal])
    end
  end

  describe "GET #show" do
    it "assigns the requested deal as @deal" do
      get :show, { id: deal.id, format: :json }
      expect(assigns(:deal)).to eq(deal)
    end
  end


  describe "POST #create" do
    let(:valid_attributes) { attributes_for(:deal) }
    let(:invalid_attributes) { attributes_for(:deal, name: nil) }
    context "with valid params" do
      it "creates a new deal" do
        expect {
          post :create, { deal: valid_attributes, format: :json }
        }.to change(Deal, :count).by(1)
      end

      it "assigns a newly created deal as @deal" do
        post :create, { deal: valid_attributes, format: :json }
        expect(assigns(:deal)).to be_a(Deal)
        expect(assigns(:deal)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved deal as @deal" do
        # post :create, {:vendor => invalid_attributes}, valid_session
        post :create, { deal: invalid_attributes, format: :json }
        expect(assigns(:deal)).to be_a_new(Deal)
      end

      it "returns unprocessable_entity status " do
        # post :create, {:vendor => invalid_attributes}, valid_session
        post :create, { deal: invalid_attributes, format: :json }
        expect(response.status).to eq(422)
      end
    end
  end


  describe "PUT #update" do
    let(:new_attributes) do
      attributes_for(:deal,
        name: "new_deal_name",
        current_amount: "13.25"
      )
    end

    let(:new_invalid_attributes) do
      attributes_for(:deal,
        name: "",
        current_amount: ""
      )
    end

    context "with valid params" do
      it "updates the requested deal" do
        # put :update, {:id => vendor.to_param, :vendor => new_attributes}, valid_session
        put :update, {:id => deal.id, deal: new_attributes, format: :json}
        deal.reload
        expect(deal.name).to eq("new_deal_name")
        expect(deal.current_amount).to eq(13.25)
      end

      it "assigns the requested deal as @deal" do
        # put :update, {:id => vendor.to_param, :vendor => valid_attributes}, valid_session
        put :update, {id: deal.id, deal: new_attributes, format: :json}
        expect(assigns(:deal)).to eq(deal)
      end
    end

    context "with invalid params" do
      it "assigns the deal as @deal" do
        # put :update, {:id => vendor.to_param, :vendor => invalid_attributes}, valid_session
        put :update, {id: deal.id, deal: new_invalid_attributes, format: :json }
        expect(assigns(:deal)).to eq(deal)
      end

      it "returns unprocessable_entity status" do
        # put :update, {:id => vendor.to_param, :vendor => invalid_attributes}, valid_session
        put :update, {id: deal.id, deal: new_invalid_attributes, format: :json}
        expect(response.status).to eq(422)
      end
    end
  end


  describe "DELETE #destroy" do
    let!(:deal) {create(:deal)}
    it "destroys the requested deal" do
      # expect {
      #   delete :destroy, {:id => vendor.to_param}, valid_session
      # }.to change(Vendor, :count).by(-1)
      expect {
        delete :destroy, { id: deal.id, format: :json }
      }.to change(Deal, :count).by(-1)
    end

    it "redirects to the deal list" do
      # delete :destroy, {:id => vendor.to_param}, valid_session
      delete :destroy, { id: deal.id, format: :json}
      expect(response.status).to eq(204)
    end
  end

end
