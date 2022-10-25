class LabelsController < ApplicationController
    def index
        @labels = Label.all
        render json: @labels
    end
end