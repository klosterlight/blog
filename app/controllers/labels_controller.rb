class LabelsController < ApplicationController
    def index
        @labels = Label.all
        render json: @labels
    end

    def show
        @label = Label.find params[:id]
        render json: @label
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
        @label = Label.find params[:id]
        @label.assign_attributes label_params
        @label.save

        if @label.save
            render json: @label
        else
            render json: { messages: @label.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private
    
    def label_params
        params.require(:label).permit(:name, :color)
    end
end