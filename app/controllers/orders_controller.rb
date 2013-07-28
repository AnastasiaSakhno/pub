class OrdersController < ApplicationController
  load_and_authorize_resource

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @order = Order.new
    @order.sales.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])
    @order_sales = @order.sales

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def close
    @order = Order.find(params[:id])
    @order.close

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to orders_url, notice: 'Order was closed.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def download
    @order = Order.find(params[:id])

    file_name = "public/downloads/orders/#{@order.table_number}_#{DateTime.now}.xls"
    workbook = WriteExcel.new(file_name, :font => 'Roman', :size => 6)
    worksheet = workbook.add_worksheet
    brf = workbook.add_format
    brf.set_bold
    brf.set_align('right')
    bf = workbook.add_format
    bf.set_bold
    worksheet.set_row(0, 40)
    worksheet.set_column('A:A', 20)
    worksheet.set_column('B:B', 4)
    worksheet.insert_image('A1',
                           File.join('public', 'MakhnoPub_logo.png'),
                           44, 3, 0.2, 0.2
    )
    worksheet.write 1, 0, t('activerecord.attributes.order.id'), brf
    worksheet.write 1, 1, @order.id, bf
    worksheet.write 2, 0, t('activerecord.attributes.order.table_number'), brf
    worksheet.write 2, 1, @order.table_number, bf
    worksheet.write 2, 3, I18n.localize(@order.datetime, :format => :long), brf
    to_pay = 0
    @order.sales.each_with_index do |sale, i|
      row = i + 4
      worksheet.write row, 0, Menu.find(sale.menu_id).name
      worksheet.write row, 1, sale.count
      worksheet.write row, 2, sale.price
      total_count = sale.count * sale.price
      to_pay += total_count
      worksheet.write row, 3, total_count
    end
    next_row = @order.sales.size + 5
    worksheet.write next_row, 2, t('activerecord.attributes.sale.total_price'), brf
    worksheet.write next_row, 3, to_pay, brf
    worksheet.write next_row + 1, 0, t('activerecord.attributes.order.welcome'), bf

    vjf = workbook.add_format(
        :bold    => 1,
        :valign  => 'vcenter',
        :align   => 'justify'
    )
    bottom_row = next_row + 4
    worksheet.merge_range("A#{bottom_row}:D#{bottom_row + 1}", t('activerecord.attributes.order.bottom_text'), vjf)

    workbook.close
    send_file file_name
  end
end
