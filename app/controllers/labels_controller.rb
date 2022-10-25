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
            render json: { message: "Label not found" }, status: :not_found
        end
    end

    def create
        exist_label = Label.where(name: params[:name])
        if exist_label.any?
            render json: { message: "Label already exist. Please use another name" }, status: :unprocessable_entity
        else
            @label = Label.create name: params[:name], color: params[:color]
            render json: @label
        end
    end
end