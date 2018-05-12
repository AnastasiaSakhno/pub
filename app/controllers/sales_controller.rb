require 'writeexcel'

class SalesController < ApplicationController
  load_and_authorize_resource

  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.ordered

    respond_to do |format|
      format.html # fillhtml.erb
      format.json { render json: @sales }
    end
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
    @sale = Sale.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sale }
    end
  end

  # GET /sales/new
  # GET /sales/new.json
  def new
    @sale = Sale.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sale }
    end
  end

  # GET /sales/1/edit
  def edit
    @sale = Sale.find(params[:id])
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(params[:sale])

    respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
        format.json { render json: @sale, status: :created, location: @sale }
      else
        format.html { render action: "new" }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sales/1
  # PUT /sales/1.json
  def update
    @sale = Sale.find(params[:id])

    respond_to do |format|
      if @sale.update_attributes(params[:sale])
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale = Sale.find(params[:id])
    @sale.destroy

    respond_to do |format|
      format.html { redirect_to sales_url }
      format.json { head :no_content }
    end
  end

  def download
    @date_from = 7.day.ago
    @date_to = DateTime.now
    @sales = Sale.where(:datetime => @date_from..@date_to)
    file_name = "public/downloads/sales/#{DateTime.now}.xls"
    workbook = WriteExcel.new file_name
    worksheet = workbook.add_worksheet
    format = workbook.add_format
    format.set_bold
    format.set_align('right')
    worksheet.write 0, 1, t('activerecord.attributes.menu.name'), format
    worksheet.write 0, 2, t('activerecord.attributes.sale.count'), format
    worksheet.write 0, 3, t('activerecord.attributes.sale.price'), format
    worksheet.write 0, 4, t('activerecord.attributes.sale.seller_id'), format
    worksheet.write 0, 5, t('activerecord.attributes.sale.client_name'), format
    worksheet.write 0, 6, t('activerecord.attributes.sale.datetime'), format
    @sales.each_with_index do |sale, i|
      row = i + 1
      worksheet.write row, 1, Menu.find(sale.menu_id).name
      worksheet.write row, 2, sale.count
      worksheet.write row, 3, sale.price
      user = User.find(sale.seller_id)
      worksheet.write row, 4, "#{user.last_name} #{user.name} #{user.middle_name}"
      worksheet.write row, 5, sale.client_name
      worksheet.write row, 6, I18n.localize(sale.datetime, :format => :long)
    end
    workbook.close
    send_file file_name
  end
end
