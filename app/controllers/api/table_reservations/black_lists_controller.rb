module Api
  module TableReservations
    class BlackListsController < ApiController
      def index
        if params[:user_phone]
          render json: TableReservation
            .for_status(:not_come)
            .for_user_phone(params[:user_phone])
        else
          fail! 'Need to specify :user_phone param', status: 400
        end
      end
    end
  end
end