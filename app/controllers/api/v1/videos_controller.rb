module Api
  module V1
    class VideosController < ApiController
      def index
        render json: Video.all
      end

      def show
        @video = Video.find(params[:id])

        render json: @video
      end
    end
  end
end
