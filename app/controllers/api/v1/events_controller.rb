module Api
  module V1
    class EventsController < ApplicationController
      def index
        render json: Event.all
      end

      def show
        render json: Event.find(params[:id])
      end
    end
  end
end
