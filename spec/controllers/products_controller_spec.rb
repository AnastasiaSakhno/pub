require 'spec_helper'

describe ProductsController do
  before(:each) do
    @product = FactoryGirl.create(:product)
    @valid_product_hash = {:name => "some name",
                           :amount_per_one => 1,
                           :measure_id => 1,
                           :total_count => 5,
                           :incoming_price => 5,
                           :sale_price => 10}
  end

  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all products as @products" do
      get :index, {}, valid_session
      assigns(:products).should eq([@product])
    end
  end

  describe "GET show" do
    it "assigns the requested product as @product" do
      get :show, {:id => @product.to_param}, valid_session
      assigns(:product).should eq(@product)
    end
  end

  describe "GET new" do
    it "assigns a new product as @product" do
      get :new, {}, valid_session
      assigns(:product).should be_a_new(Product)
    end
  end

  describe "GET edit" do
    it "assigns the requested product as @product" do
      get :edit, {:id => @product.to_param}, valid_session
      assigns(:product).should eq(@product)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Product" do
        create_product.should change(Product, :count).by(1)
      end

      it "assigns a newly created product as @product" do
        call_lambda create_product
        assigns(:product).should be_a(Product)
        assigns(:product).should be_persisted
      end

      it "redirects to the created product" do
        call_lambda create_product
        response.should redirect_to(Product.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved product as @product" do
        Product.any_instance.stub(:save).and_return(false)
        @created_product = create_product.call ({:name => "invalid value"})
        assigns(@created_product).should be_a_new(Product)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Product.any_instance.stub(:save).and_return(false)
        create_product.call ({:name => "invalid value"})
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested product" do
        Product.any_instance.should_receive(:update_attributes).with({"name" => "MyString"})
        update_product.call ({"name" => "MyString"})
      end

      it "assigns the requested product as @product" do
        @updated_product = call_lambda update_product
        assigns(@updated_product).should eq(@product)
      end

      it "redirects to the product" do
        call_lambda update_product
        response.should redirect_to(@product)
      end
    end

    describe "with invalid params" do
      it "assigns the product as @product" do
        # Trigger the behavior that occurs when invalid params are submitted
        Product.any_instance.stub(:save).and_return(false)
        @updated_product = update_product.call ({"name" => "invalid value"})
        assigns(@updated_product).should eq(@product)
      end

      it "re-renders the 'edit' template" do
        Product.any_instance.stub(:save).and_return(false)
        update_product.call ({"name" => "invalid value"})
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested product" do
      delete_product.should change(Product, :count).by(-1)
    end

    it "redirects to the products list" do
      call_lambda delete_product
      response.should redirect_to(products_path)
    end
  end

  private

  def create_product
    lambda do |hash = @valid_product_hash|
      post :create, {:product => hash}, valid_session
      :product
    end
  end

  def update_product
    lambda do |hash = @valid_product_hash|
      put :update, {:id => @product.to_param, :product => hash}, valid_session
      :product
    end
  end

  def delete_product
    lambda do
      delete :destroy, {:id => @product.to_param}, valid_session
    end
  end
end
