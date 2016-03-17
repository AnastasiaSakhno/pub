class MenuPagesController < ApplicationController
  load_and_authorize_resource
  cache_sweeper :menu_page_sweeper, :only => [:create, :update, :destroy]

  # GET /menu_pages
  # GET /menu_pages.json
  def index
    @menu_pages = MenuPage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @menu_pages }
    end
  end

  # GET /menu_pages/1
  # GET /menu_pages/1.json
  def show
    @menu_page = MenuPage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @menu_page }
    end
  end

  # GET /menu_pages/new
  # GET /menu_pages/new.json
  def new
    @menu_page = MenuPage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @menu_page }
    end
  end

  # GET /menu_pages/1/edit
  def edit
    @menu_page = MenuPage.find(params[:id])
  end

  # POST /menu_pages
  # POST /menu_pages.json
  def create
    @menu_page = MenuPage.new(params[:menu_page])

    respond_to do |format|
      if @menu_page.save
        format.html { redirect_to @menu_page, notice: 'Menu page was successfully created.' }
        format.json { render json: @menu_page, status: :created, location: @menu_page }
      else
        format.html { render action: "new" }
        format.json { render json: @menu_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /menu_pages/1
  # PUT /menu_pages/1.json
  def update
    @menu_page = MenuPage.find(params[:id])

    respond_to do |format|
      if @menu_page.update_attributes(params[:menu_page])
        format.html { redirect_to @menu_page, notice: 'Menu page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @menu_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_pages/1
  # DELETE /menu_pages/1.json
  def destroy
    @menu_page = MenuPage.find(params[:id])
    @menu_page.destroy

    respond_to do |format|
      format.html { redirect_to menu_pages_url }
      format.json { head :no_content }
    end
  end
end
