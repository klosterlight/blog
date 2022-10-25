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

    def update
        @label = Label.find_by id: params[:id]
        if @label.present?
            @label.assign_attributes label_params
            @label.save

            if @label.save
                render json: @label
            else
                render json: { messages: @label.errors.full_messages }, status: :unprocessable_entity
            end
        else
            render json: { messages: ["Label not found"] }, status: :not_found
        end
    end

    private
    
    def label_params
        params.require(:label).permit(:name, :color)
    end
end