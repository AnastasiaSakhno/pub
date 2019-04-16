class TableReservationsController < ApplicationController
  respond_to :html, :js

  include DateHelper

  # GET /table_reservations
  # GET /table_reservations.json
  def index
    @status = params[:status] || :filled
    @date = date_from_date_select_params(params[:search], :date) || Date.current

    @table_reservations = TableReservation.for_status(@status)
      .for_date(@date)
      .paginate(page: params[:page], per_page: 6)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @table_reservations }
    end
  end

  # GET /table_reservations/1
  # GET /table_reservations/1.json
  def show
    @table_reservation = TableReservation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @table_reservation }
    end
  end

  # GET /table_reservations/new
  # GET /table_reservations/new.json
  def new
    @table_reservation = TableReservation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @table_reservation }
    end
  end

  # GET /table_reservations/1/edit
  def edit
    @table_reservation = TableReservation.find(params[:id])
  end

  # POST /table_reservations
  # POST /table_reservations.json
  def create
    @table_reservation = TableReservation.new(params[:table_reservation])

    respond_to do |format|
      if @table_reservation.save
        format.html { redirect_to @table_reservation, notice: 'Table reservation was successfully created.' }
        format.json { render json: @table_reservation, status: :created, location: @table_reservation }
      else
        format.html { render action: "new" }
        format.json { render json: @table_reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /table_reservations/1
  # PUT /table_reservations/1.json
  def update
    @table_reservation = TableReservation.find(params[:id])

    respond_to do |format|
      if @table_reservation.update_attributes(params[:table_reservation])
        format.html { redirect_to :index, notice: 'Table reservation was successfully updated.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render action: "edit" }
        format.json { render json: @table_reservation.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /table_reservations/1
  # DELETE /table_reservations/1.json
  def destroy
    @table_reservation = TableReservation.find(params[:id])
    @table_reservation.destroy

    respond_to do |format|
      format.html { redirect_to table_reservations_url }
      format.json { head :no_content }
    end
  end
end
