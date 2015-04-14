module Api
  module V1
    class PresentersController < ApiController
      def index
        render json: Presenter.all
      end

      def show
        render json: Presenter.find(params[:id])
      end
    end
  end
end
