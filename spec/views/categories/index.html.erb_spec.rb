require 'spec_helper'

describe "categories/fill" do
  before(:each) do
    create_and_sign_in_admin
    assign(:categories, [
      stub_model(Category,
        :name => "Name"
      ),
      stub_model(Category,
        :name => "Name"
      )
    ])
  end

  it "renders a list of categories" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
