require 'rails_helper'

RSpec.describe "articles/fill", :type => :view do
  before(:each) do
    assign(:articles, [
      Article.create!(
        :name => "Name",
        :desc => "MyText",
        :material => nil
      ),
      Article.create!(
        :name => "Name",
        :desc => "MyText",
        :material => nil
      )
    ])
  end

  it "renders a list of articles" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
