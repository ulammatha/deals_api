class Api::V1::DealsController < ApiController
  before_action :set_deal, only: [:show, :update, :destroy]

  def index
    @deals = Deal.all

    render json: @deals
  end

  def show
    render json: @deal
  end

  def create
    @deal = Deal.new(deal_params)
    if @deal.save
      render json: @deal, status: :created, location: false
    else
      render_unprocessable_entity_response(@deal.errors)
    end
  end

  def update
    @deal = Deal.find(params[:id])

    if @deal.update(deal_params)
      head :no_content
    else
      render_unprocessable_entity_response(@deal.errors)
    end
  end

  def destroy
    @deal.destroy

    head :no_content
  end

  private

    def set_deal
      @deal = Deal.find(params[:id])
    end

    def deal_params
      params.require(:deal)
      .permit(:name,
        :description,
        :current_amount,
        :previous_amount,
        :expiry,
        :available_coupons,
        :sold_coupons,
        :image,
        :restaurant_id
      )
    end
end
