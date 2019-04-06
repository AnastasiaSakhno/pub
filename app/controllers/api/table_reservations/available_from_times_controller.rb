module Api
  module TableReservations
    class AvailableFromTimesController < ApiController
      def index
        render json: TableReservation::AVAILABLE_TIME.slice(0, TableReservation::AVAILABLE_TIME.size - 1)
      end
    end
  end
end