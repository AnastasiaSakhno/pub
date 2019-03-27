module Api
	module TableReservations
    class AvailableTablesController < ApiController
      def index
        if params[:chat_id]
          render json: TableReservation.available_tables(params[:chat_id])
        else
          fail! 'Need to specify :chat_id param', status: 400
        end
      end
    end
  end
end