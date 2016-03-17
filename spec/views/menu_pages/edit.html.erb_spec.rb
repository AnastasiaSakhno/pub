require 'spec_helper'

describe "menu_pages/edit" do
  before(:each) do
    @menu_page = assign(:menu_page, stub_model(MenuPage,
      :picture => "MyString"
    ))
  end

  it "renders the edit menu_page form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", menu_page_path(@menu_page), "post" do
      assert_select "input#menu_page_picture[name=?]", "menu_page[picture]"
    end
  end
end
