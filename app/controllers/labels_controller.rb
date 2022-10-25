class LabelsController < ApplicationController
    before_action :find_label, only: [:show, :update, :destroy]

    def index
        @labels = Label.all
        render json: @labels
    end

    def show
        render json: @label
    end

    def create
        @label = Label.new label_params
        if @label.save
            render json: @label
        else
            render json: { messages: @label.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def update
        if @label.save label_params
            render json: @label
        else
            render json: { messages: @label.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy
        @label.destroy

        head 200
    end

    private
    
    def label_params
        params.require(:label).permit(:name, :color)
    end

    def find_label
        @label = Label.find params[:id]
    end
end