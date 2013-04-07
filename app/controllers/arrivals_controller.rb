require 'writeexcel'

class ArrivalsController < ApplicationController
  # GET /arrivals
  # GET /arrivals.json
  def index
    @arrivals = Arrival.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @arrivals }
    end
  end

  # GET /arrivals/1
  # GET /arrivals/1.json
  def show
    @arrival = Arrival.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @arrival }
    end
  end

  # GET /arrivals/new
  # GET /arrivals/new.json
  def new
    @arrival = Arrival.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @arrival }
    end
  end

  # GET /arrivals/1/edit
  def edit
    @arrival = Arrival.find(params[:id])
  end

  # POST /arrivals
  # POST /arrivals.json
  def create
    @arrival = Arrival.new(params[:arrival])

    respond_to do |format|
      if @arrival.save
        format.html { redirect_to @arrival, notice: 'Arrival was successfully created.' }
        format.json { render json: @arrival, status: :created, location: @arrival }
      else
        format.html { render action: "new" }
        format.json { render json: @arrival.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /arrivals/1
  # PUT /arrivals/1.json
  def update
    @arrival = Arrival.find(params[:id])

    respond_to do |format|
      if @arrival.update_attributes(params[:arrival])
        format.html { redirect_to @arrival, notice: 'Arrival was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @arrival.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /arrivals/1
  # DELETE /arrivals/1.json
  def destroy
    @arrival = Arrival.find(params[:id])
    @arrival.destroy

    respond_to do |format|
      format.html { redirect_to arrivals_url }
      format.json { head :no_content }
    end
  end

  def download
    @date_from = 7.day.ago
    @date_to = DateTime.now
    @arrivals = Arrival.where(:created_at => @date_from..@date_to)
    file_name = "public/downloads/arrivals/#{DateTime.now}.xls"
    workbook = WriteExcel.new file_name
    worksheet = workbook.add_worksheet
    format = workbook.add_format
    format.set_bold
    format.set_align('right')
    worksheet.write 0, 1, t('activerecord.attributes.arrival.product_id'), format
    worksheet.write 0, 2, t('activerecord.attributes.arrival.count'), format
    worksheet.write 0, 3, t('activerecord.attributes.arrival.incoming_price'), format
    worksheet.write 0, 4, t('activerecord.attributes.arrival.sale_price'), format
    worksheet.write 0, 5, t('activerecord.attributes.arrival.receiver_id'), format
    worksheet.write 0, 6, t(:created_at), format
    @arrivals.each_with_index do |arrival, i|
      row = i + 1
      worksheet.write row, 1, Product.find(arrival.product_id).name
      worksheet.write row, 2, arrival.count
      worksheet.write row, 3, arrival.incoming_price
      worksheet.write row, 4, arrival.sale_price
      user = User.find(arrival.receiver_id)
      worksheet.write row, 5, "#{user.last_name} #{user.name} #{user.middle_name}"
      worksheet.write row, 6, I18n.localize(arrival.created_at, :format => :long)
    end
    workbook.close
    send_file file_name
  end
end
