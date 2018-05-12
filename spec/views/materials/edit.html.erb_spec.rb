require 'rails_helper'

RSpec.describe "materials/edit", :type => :view do
  before(:each) do
    @material = assign(:material, Material.create!(
      :name => "MyString",
      :cast => nil
    ))
  end

  it "renders the edit material form" do
    render

    assert_select "form[action=?][method=?]", material_path(@material), "post" do

      assert_select "input#material_name[name=?]", "material[name]"

      assert_select "input#material_cast[name=?]", "material[cast]"
    end
  end
end
