require 'rails_helper'

RSpec.describe "articles/new", :type => :view do
  before(:each) do
    assign(:article, Article.new(
      :name => "MyString",
      :desc => "MyText",
      :material => nil
    ))
  end

  it "renders new article form" do
    render

    assert_select "form[action=?][method=?]", articles_path, "post" do

      assert_select "input#article_name[name=?]", "article[name]"

      assert_select "textarea#article_desc[name=?]", "article[desc]"

      assert_select "input#article_material[name=?]", "article[material]"
    end
  end
end
