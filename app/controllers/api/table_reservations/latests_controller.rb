module Api
  module TableReservations
    class LatestsController < ApiController
      respond_to :json

      def show
        render json: TableReservation.latest(params[:chat_id])
      end
    end
  end
end