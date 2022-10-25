class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound do |error|
        render json: { messages: [error.message] }, status: 404
    end
end
