class TableReservationBlackoutDatesController < ApplicationController
  # GET /table_reservation_blackout_dates
  # GET /table_reservation_blackout_dates.json
  def index
    @table_reservation_blackout_dates = TableReservationBlackoutDate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @table_reservation_blackout_dates }
    end
  end

  # GET /table_reservation_blackout_dates/new
  # GET /table_reservation_blackout_dates/new.json
  def new
    @table_reservation_blackout_date = TableReservationBlackoutDate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @table_reservation_blackout_date }
    end
  end

  # POST /table_reservation_blackout_dates
  # POST /table_reservation_blackout_dates.json
  def create
    @table_reservation_blackout_date = TableReservationBlackoutDate.new(params[:table_reservation_blackout_date])

    respond_to do |format|
      if @table_reservation_blackout_date.save
        format.html { redirect_to table_reservation_blackout_dates_path, notice: 'Table reservation blackout date was successfully created.' }
        format.json { render json: @table_reservation_blackout_date, status: :created, location: @table_reservation_blackout_date }
      else
        format.html { render action: "new" }
        format.json { render json: @table_reservation_blackout_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /table_reservation_blackout_dates/1
  # DELETE /table_reservation_blackout_dates/1.json
  def destroy
    @table_reservation_blackout_date = TableReservationBlackoutDate.find(params[:id])
    @table_reservation_blackout_date.destroy

    respond_to do |format|
      format.html { redirect_to table_reservation_blackout_dates_url }
      format.json { head :no_content }
    end
  end
end
