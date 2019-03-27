module Api
  class TableReservationsController < ApiController
    respond_to :json

    def create
      @table_reservation = TableReservation.new(table_reservation_params)

      if @table_reservation.save
        respond_with @table_reservation
      else
        render json: @table_reservation.errors, status: :unprocessable_entity
      end
    end

    def update
      @table_reservation = TableReservation.find(params[:id])

      if @table_reservation.update_attributes(table_reservation_params)
        head :no_content
      else
        render json: @table_reservation.errors, status: :unprocessable_entity
      end
    end

    private

    def table_reservation_params
      params
        .require(:table_reservation)
        .permit(:chat_id, :date, :hall, :table, :hour_from, :hour_to, :user_name, :user_phone, :people_number, :status)
    end
  end
end