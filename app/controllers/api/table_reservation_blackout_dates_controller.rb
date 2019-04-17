module Api
  class TableReservationBlackoutDatesController < ApiController

    def index
      if(params[:date] && params[:hall])
        @table_reservation_blackout_dates = TableReservationBlackoutDate
          .for_date(params[:date])
          .for_hall(params[:hall])

        render json: @table_reservation_blackout_dates
      else
        fail! 'Need to specify :date and :hall params', status: 400
      end
    end

  end
end
