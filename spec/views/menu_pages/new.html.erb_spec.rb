require 'spec_helper'

describe "menu_pages/new" do
  before(:each) do
    assign(:menu_page, stub_model(MenuPage,
      :picture => "MyString"
    ).as_new_record)
  end

  it "renders new menu_page form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", menu_pages_path, "post" do
      assert_select "input#menu_page_picture[name=?]", "menu_page[picture]"
    end
  end
end
