module Api
  module TableReservations
    class LatestsController < ApiController
      respond_to :json

      def show
      	if params[:chat_id]
	        render json: TableReservation.latest(params[:chat_id])
	      else
          fail! 'Need to specify :chat_id param', status: 400
        end
      end
    end
  end
end