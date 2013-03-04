require 'spec_helper'

describe SalesController do
  before(:each) do
    @menu = FactoryGirl.create(:menu)
    @sale = FactoryGirl.create(:sale)
    @sale.menu_id = @menu.id
    @sale.save
    @valid_sale_hash = {:menu_id => @menu.id}
    @invalid_sale_hash = {:menu_id => "string"}
  end

  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all sales as @sales" do
      get :index, {}, valid_session
      assigns(:sales).should eq([@sale])
    end
  end

  describe "GET show" do
    it "assigns the requested sale as @sale" do
      get :show, {:id => @sale.to_param}, valid_session
      assigns(:sale).should eq(@sale)
    end
  end

  describe "GET new" do
    it "assigns a new sale as @sale" do
      get :new, {}, valid_session
      assigns(:sale).should be_a_new(Sale)
    end
  end

  describe "GET edit" do
    it "assigns the requested sale as @sale" do
      get :edit, {:id => @sale.to_param}, valid_session
      assigns(:sale).should eq(@sale)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Sale" do
        create_sale.should change(Sale, :count).by(1)
      end

      it "assigns a newly created sale as @sale" do
        call_lambda create_sale
        assigns(:sale).should be_a(Sale)
        assigns(:sale).should be_persisted
      end

      it "redirects to the created sale" do
        call_lambda create_sale
        response.should redirect_to(Sale.last)
      end
    end

    describe "with invalid params" do
      it "re-renders the 'new' template" do
        Sale.any_instance.stub(:save).and_return(false)
        create_sale.call @invalid_sale_hash
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested sale" do
        hash = { "menu_id" => "2" }
        Sale.any_instance.should_receive(:update_attributes).with(hash)
        update_sale.call hash
      end

      it "assigns the requested sale as @sale" do
        update_sale.call @valid_sale_hash
        assigns(:sale).should eq(@sale)
      end

      it "redirects to the sale" do
        update_sale.call @valid_sale_hash
        response.should redirect_to(@sale)
      end
    end

    describe "with invalid params" do
      it "assigns the sale as @sale" do
        Sale.any_instance.stub(:save).and_return(false)
        update_sale.call @invalid_sale_hash
        assigns(:sale).should eq(@sale)
      end

      it "re-renders the 'edit' template" do
        Sale.any_instance.stub(:save).and_return(false)
        update_sale.call @invalid_sale_hash
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested sale" do
      delete_sale.should change(Sale, :count).by(-1)
    end

    it "redirects to the sales list" do
      call_lambda delete_sale
      response.should redirect_to(sales_path)
    end
  end

  private

  def create_sale
    lambda do |hash = @valid_sale_hash|
      post :create, {:sale => hash}, valid_session
      :sale
    end
  end

  def update_sale
    lambda do |hash = @valid_sale_hash|
      put :update, {:id => @sale.to_param, :sale => hash}, valid_session
      :sale
    end
  end

  def delete_sale
    lambda do
      delete :destroy, {:id => @sale.to_param}, valid_session
    end
  end
end
