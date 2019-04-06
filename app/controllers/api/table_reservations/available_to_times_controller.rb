module Api
  module TableReservations
    class AvailableToTimesController < ApiController
      def index
      	if params[:chat_id]
          table_reservation = TableReservation.latest(params[:chat_id])
	        render json: table_reservation.available_to_times
	      else
          fail! 'Need to specify :chat_id param', status: 400
        end
      end
    end
  end
end