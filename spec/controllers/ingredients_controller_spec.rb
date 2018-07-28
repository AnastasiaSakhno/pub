require 'spec_helper'

describe IngredientsController do
  before(:each) do
    create_and_sign_in_admin
    @ingredient = FactoryGirl.create(:ingredient)

    @valid_ingredient_hash = {:product_id => 1,
                              :menu_id => 1,
                              :amount => 1.5}
    @invalid_ingredient_hash = {:product_id => 1}
  end

  it{ should be_able_to(:manage, Ingredient.new) }

  describe "GET fill" do
    it "assigns all ingredients as @ingredients" do
      get :fill, {}
      assigns(:ingredients).should eq([@ingredient])
    end
  end

  describe "GET show" do
    it "assigns the requested ingredient as @ingredient" do
      get :show, {:id => @ingredient.to_param}
      assigns(:ingredient).should eq(@ingredient)
    end
  end

  describe "GET new" do
    it "assigns a new ingredient as @ingredient" do
      get :new, {}
      assigns(:ingredient).should be_a_new(Ingredient)
    end
  end

  describe "GET edit" do
    it "assigns the requested ingredient as @ingredient" do
      get :edit, {:id => @ingredient.to_param}
      assigns(:ingredient).should eq(@ingredient)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Ingredient" do
        create_ingredient.should change(Ingredient, :count).by(1)
      end

      it "assigns a newly created ingredient as @ingredient" do
        call_lambda create_ingredient
        assigns(:ingredient).should be_a(Ingredient)
        assigns(:ingredient).should be_persisted
      end

      it "redirects to the created ingredient" do
        call_lambda create_ingredient
        response.should redirect_to(Ingredient.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved ingredient as @ingredient" do
        Ingredient.any_instance.stub(:save).and_return(false)
        create_ingredient.call @invalid_ingredient_hash
        assigns(:ingredient).should be_a_new(Ingredient)
      end

      it "re-renders the 'new' template" do
        Ingredient.any_instance.stub(:save).and_return(false)
        create_ingredient.call @invalid_ingredient_hash
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested ingredient" do
        update_ingredient.call @valid_ingredient_hash
      end

      it "assigns the requested ingredient as @ingredient" do
        call_lambda update_ingredient
        assigns(:ingredient).should eq(@ingredient)
      end

      it "redirects to the ingredient" do
        call_lambda update_ingredient
        response.should redirect_to(@ingredient)
      end
    end

    describe "with invalid params" do
      it "assigns the ingredient as @ingredient" do
        update_ingredient.call @invalid_ingredient_hash
        assigns(:ingredient).should eq(@ingredient)
      end

      it "re-renders the 'edit' template" do
        Ingredient.any_instance.stub(:save).and_return(false)
        update_ingredient.call @invalid_ingredient_hash
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested ingredient" do
      delete_ingredient.should change(Ingredient, :count).by(-1)
    end

    it "redirects to the ingredients list" do
      call_lambda delete_ingredient
      response.should redirect_to(ingredients_path)
    end
  end

  private

  def create_ingredient
    lambda do |hash = @valid_ingredient_hash|
      post :create, {:ingredient => hash}
      :ingredient
    end
  end

  def update_ingredient
    lambda do |hash = @valid_ingredient_hash|
      put :update, {:id => @ingredient.to_param, :ingredient => hash}
      :ingredient
    end
  end

  def delete_ingredient
    lambda do
      delete :destroy, {:id => @ingredient.to_param}
    end
  end
end
