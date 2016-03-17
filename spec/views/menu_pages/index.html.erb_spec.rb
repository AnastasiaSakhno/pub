require 'spec_helper'

describe "menu_pages/index" do
  before(:each) do
    assign(:menu_pages, [
      stub_model(MenuPage,
        :picture => "Picture"
      ),
      stub_model(MenuPage,
        :picture => "Picture"
      )
    ])
  end

  it "renders a list of menu_pages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Picture".to_s, :count => 2
  end
end
