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

    def destroy
      @table_reservation = TableReservation.find(params[:id])

      @table_reservation.destroy

      head :no_content
    end

    private

    def table_reservation_params
      params[:table_reservation]
    end
  end
end