require 'rails_helper'

RSpec.describe "materials/new", :type => :view do
  before(:each) do
    assign(:material, Material.new(
      :name => "MyString",
      :cast => nil
    ))
  end

  it "renders new material form" do
    render

    assert_select "form[action=?][method=?]", materials_path, "post" do

      assert_select "input#material_name[name=?]", "material[name]"

      assert_select "input#material_cast[name=?]", "material[cast]"
    end
  end
end
