require 'spec_helper'

describe ArrivalsController do
  before(:each) do
    create_and_sign_in_admin
    @product = FactoryGirl.create(:product)
    @arrival = FactoryGirl.create(:arrival)
    @arrival.product_id = @product.id
    @arrival.save
    @valid_arrival_hash = {
        :product_id => @product.id,
        :incoming_price => 1.5,
        :sale_price => 5.5,
        :count => 10,
        :receiver_id => 1
    }
    @invalid_arrival_hash = {:product_id => "string"}
  end

  it { should be_able_to(:manage, Arrival.new) }

  describe "GET fill" do
    it "assigns all arrivals as @arrivals" do
      get :fill, {}
      assigns(:arrivals).should eq([@arrival])
    end
  end

  describe "GET show" do
    it "assigns the requested arrival as @arrival" do
      get :show, {:id => @arrival.to_param}
      assigns(:arrival).should eq(@arrival)
    end
  end

  describe "GET new" do
    it "assigns a new arrival as @arrival" do
      get :new, {}
      assigns(:arrival).should be_a_new(Arrival)
    end
  end

  describe "GET edit" do
    it "assigns the requested arrival as @arrival" do
      get :edit, {:id => @arrival.to_param}
      assigns(:arrival).should eq(@arrival)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Arrival" do
        create_arrival.should change(Arrival, :count).by(1)
      end

      it "assigns a newly created arrival as @arrival" do
        call_lambda create_arrival
        assigns(:arrival).should be_a(Arrival)
        assigns(:arrival).should be_persisted
      end

      it "redirects to the created arrival" do
        call_lambda create_arrival
        response.should redirect_to(Arrival.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved arrival as @arrival" do
        Arrival.any_instance.stub(:save).and_return(false)
        create_arrival.call @invalid_arrival_hash
        assigns(:arrival).should be_a_new(Arrival)
      end

      it "re-renders the 'new' template" do
        Arrival.any_instance.stub(:save).and_return(false)
        create_arrival.call @invalid_arrival_hash
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested arrival" do
        hash = {"product_id" => "2"}
        Arrival.any_instance.should_receive(:update_attributes).with(hash)
        update_arrival.call hash
      end

      it "assigns the requested arrival as @arrival" do
        update_arrival.call @valid_arrival_hash
        assigns(:arrival).should eq(@arrival)
      end

      it "redirects to the arrival" do
        update_arrival.call @valid_arrival_hash
        response.should redirect_to(@arrival)
      end
    end

    describe "with invalid params" do
      it "assigns the arrival as @arrival" do
        Arrival.any_instance.stub(:save).and_return(false)
        update_arrival.call @valid_arrival_hash
        assigns(:arrival).should eq(@arrival)
      end

      it "re-renders the 'edit' template" do
        Arrival.any_instance.stub(:save).and_return(false)
        update_arrival.call @valid_arrival_hash
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested arrival" do
      delete_arrival.should change(Arrival, :count).by(-1)
    end

    it "redirects to the arrivals list" do
      call_lambda delete_arrival
      response.should redirect_to(arrivals_path)
    end
  end

  private

  def create_arrival
    lambda do |hash = @valid_arrival_hash|
      post :create, {:arrival => hash}
      :arrival
    end
  end

  def update_arrival
    lambda do |hash = @valid_arrival_hash|
      put :update, {:id => @arrival.to_param, :arrival => hash}
      :arrival
    end
  end

  def delete_arrival
    lambda do
      delete :destroy, {:id => @arrival.to_param}
    end
  end

end
