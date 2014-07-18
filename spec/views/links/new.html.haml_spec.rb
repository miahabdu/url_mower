require 'spec_helper'

describe "links/new" do
  before(:each) do
    assign(:link, stub_model(Link,
      :original_url => "MyString",
      :slug => "MyString",
      :clicks => 1,
      :screenshot => "MyString",
      :title => "MyString"
    ).as_new_record)
  end

  it "renders new link form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", links_path, "post" do
      assert_select "input#link_original_url[name=?]", "link[original_url]"
      assert_select "input#link_slug[name=?]", "link[slug]"
      assert_select "input#link_clicks[name=?]", "link[clicks]"
      assert_select "input#link_screenshot[name=?]", "link[screenshot]"
      assert_select "input#link_title[name=?]", "link[title]"
    end
  end
end
