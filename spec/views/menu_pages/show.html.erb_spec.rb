require 'spec_helper'

describe "menu_pages/show" do
  before(:each) do
    @menu_page = assign(:menu_page, stub_model(MenuPage,
      :picture => "Picture"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Picture/)
  end
end
