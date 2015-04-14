module Api
  module V1
    class ConferencesController < ApiController
      def index
        render json: Conference.all
      end

      def show
        render json: Conference.find(params[:id])
      end
    end
  end
end
