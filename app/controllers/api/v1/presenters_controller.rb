module Api
  module V1
    class PresentersController < ApplicationController
      def index
        render json: Presenter.all
      end

      def show
        render json: Presenter.find(params[:id])
      end
    end
  end
end
