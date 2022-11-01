class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound do |error|
    render json: { messages: [error.message] }, status: :not_found
  end
end
