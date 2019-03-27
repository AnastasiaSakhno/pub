class TableReservationsController < ApplicationController
  # GET /table_reservations
  # GET /table_reservations.json
  def index
    @table_reservations = TableReservation.all

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
    update_attrs(params[:table_reservation])
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

  def confirm
    update_attrs(status: :confirmed)
  end

  def reject
    update_attrs(status: :rejected)
  end

  private

  def update_attrs(attrs)
    @table_reservation = TableReservation.find(params[:id])

    respond_to do |format|
      if @table_reservation.update_attributes(attrs)
        format.html { redirect_to @table_reservation, notice: 'Table reservation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @table_reservation.errors, status: :unprocessable_entity }
      end
    end
  end
end
