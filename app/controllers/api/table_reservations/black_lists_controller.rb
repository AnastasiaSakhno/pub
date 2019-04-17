module Api
  module TableReservations
    class BlackListsController < ApiController
      def index
        if params[:phone_number]
          render json: TableReservation
            .for_status(:not_come)
            .for_phone_number(params[:phone_number])
        else
          fail! 'Need to specify :phone_number param', status: 400
        end
      end
    end
  end
end