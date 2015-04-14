module Api
  module V1
    class NotesController < ApiController
      before_action :doorkeeper_authorize!

      def index
        # need to setup notes model. then i can do current_resource_owner.notes
        render json: current_resource_owner
      end
    end
  end
end
