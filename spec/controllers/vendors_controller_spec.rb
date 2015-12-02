require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe Api::V1::VendorsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Vendor. As you add validations to Vendor, be sure to
  # adjust the attributes here as well.
  let!(:vendor) {create(:vendor)}
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # VendorsController. Be sure to keep this updated too.
  let(:valid_session) { {} }


  describe "GET #index" do
    it "assigns all vendors as @vendors" do
      # get :index, {format: :json}, valid_session
      get :index, { format: :json }
      expect(assigns(:vendors)).to eq([vendor])
    end
  end

  describe "GET #show" do
    it "assigns the requested vendor as @vendor" do
      # get :show, {:id => vendor.id}, valid_session
      get :show, { id: vendor.id, format: :json }
      expect(assigns(:vendor)).to eq(vendor)
    end
  end


  describe "POST #create" do
    let(:valid_attributes) { attributes_for(:vendor) }
    let(:invalid_attributes) { attributes_for(:vendor, first_name: nil) }
    context "with valid params" do
      it "creates a new Vendor" do
        # expect {
        #   post :create, {:vendor => valid_attributes}, valid_session
        # }.to change(Vendor, :count).by(1)
        expect {
          post :create, { vendor: valid_attributes, format: :json }
        }.to change(Vendor, :count).by(1)
      end

      it "assigns a newly created vendor as @vendor" do
        # post :create, {:vendor => valid_attributes}, valid_session
        post :create, { vendor: valid_attributes, format: :json }
        expect(assigns(:vendor)).to be_a(Vendor)
        expect(assigns(:vendor)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved vendor as @vendor" do
        # post :create, {:vendor => invalid_attributes}, valid_session
        post :create, { vendor: invalid_attributes, format: :json }
        expect(assigns(:vendor)).to be_a_new(Vendor)
      end

      it "returns unprocessable_entity status " do
        # post :create, {:vendor => invalid_attributes}, valid_session
        post :create, { vendor: invalid_attributes, format: :json }
        expect(response.status).to eq(422)
      end
    end
  end

  describe "PUT #update" do
    let(:new_attributes) do
      attributes_for(:vendor,
        first_name: "new_name",
        phone: "7779998888"
      )
    end

    let(:new_invalid_attributes) do
      attributes_for(:vendor,
        first_name: "",
        phone: ""
      )
    end

    context "with valid params" do
      it "updates the requested vendor" do
        # put :update, {:id => vendor.to_param, :vendor => new_attributes}, valid_session
        put :update, {:id => vendor.id, vendor: new_attributes, format: :json}
        vendor.reload
        expect(vendor.first_name).to eq("new_name")
        expect(vendor.phone).to eq("7779998888")
      end

      it "assigns the requested vendor as @vendor" do
        # put :update, {:id => vendor.to_param, :vendor => valid_attributes}, valid_session
        put :update, {id: vendor.id, vendor: new_attributes, format: :json}
        expect(assigns(:vendor)).to eq(vendor)
      end
    end

    context "with invalid params" do
      it "assigns the vendor as @vendor" do
        # put :update, {:id => vendor.to_param, :vendor => invalid_attributes}, valid_session
        put :update, {id: vendor.id, vendor: new_invalid_attributes, format: :json }
        expect(assigns(:vendor)).to eq(vendor)
      end

      it "returns unprocessable_entity status" do
        # put :update, {:id => vendor.to_param, :vendor => invalid_attributes}, valid_session
        put :update, {id: vendor.id, vendor: new_invalid_attributes, format: :json}
        expect(response.status).to eq(422)
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:vendor) {create(:vendor)}
    it "destroys the requested vendor" do
      # expect {
      #   delete :destroy, {:id => vendor.to_param}, valid_session
      # }.to change(Vendor, :count).by(-1)
      expect {
        delete :destroy, { id: vendor.id, format: :json }
      }.to change(Vendor, :count).by(-1)
    end

    it "redirects to the vendors list" do
      # delete :destroy, {:id => vendor.to_param}, valid_session
      delete :destroy, { id: vendor.id, format: :json}
      expect(response.status).to eq(204)
    end
  end
end
