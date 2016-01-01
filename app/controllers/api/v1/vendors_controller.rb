class Api::V1::VendorsController < ApiController
  before_action :set_vendor, only: [:show, :update, :destroy]

  def index
    @vendors = Vendor.all

    render(
      json: @vendors,
      each_serializer: Api::V1::VendorSerializer,
      root: false,
      status: 200
    )
  end

  def show
    render json: @vendor
  end

  def create
    @vendor = Vendor.new(vendor_params)

    if @vendor.save
      render json: @vendor, status: :created, location: false
    else
      render_unprocessable_entity_response(@vendor.errors)
      # render json: @vendor.errors, status: :unprocessable_entity
    end
  end

  def update
    @vendor = Vendor.find(params[:id])

    if @vendor.update(vendor_params)
      head :no_content
    else
      render_unprocessable_entity_response(@vendor.errors)
      # render json: @vendor.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @vendor.destroy

    head :no_content
  end

  private

    def set_vendor
      @vendor = Vendor.find(params[:id])
    end

    def vendor_params
      params.require(:vendor).permit(:first_name, :last_name, :phone, :email)
    end
end
