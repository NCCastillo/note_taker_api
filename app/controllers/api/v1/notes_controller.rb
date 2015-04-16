module Api
  module V1
    class NotesController < ApiController
      before_action :doorkeeper_authorize!

      def index
        @notes = current_resource_owner.notes

        render json: @notes
      end

      def show
        @note = current_resource_owner.notes.where(id: params[:id]).first

        render json: @note
      end
    end
  end
end
