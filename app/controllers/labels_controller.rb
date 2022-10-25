class LabelsController < ApplicationController
    def index
        @labels = Label.all
        render json: @labels
    end

    def show
        @label = Label.find_by id: params[:id]
        if @label.present?
            render json: @label
        else
            render json: { messages: ["Label not found"] }, status: :not_found
        end
    end

    def create
        @label = Label.new name: params[:name], color: params[:color]
        if @label.save
            render json: @label
        else
            render json: { messages: @label.errors.full_messages }, status: :unprocessable_entity
        end
    end
end