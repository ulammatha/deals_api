class ApiController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  include Renderable

  # before_filter :ensure_valid_api_key, :ensure_current_user

  private

  def record_not_found
    render json: {}, status: :not_found
  end
end