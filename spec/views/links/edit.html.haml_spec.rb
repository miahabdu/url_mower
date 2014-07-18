require 'spec_helper'

describe "links/edit" do
  before(:each) do
    @link = assign(:link, stub_model(Link,
      :original_url => "MyString",
      :slug => "MyString",
      :clicks => 1,
      :screenshot => "MyString",
      :title => "MyString"
    ))
  end

  it "renders the edit link form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", link_path(@link), "post" do
      assert_select "input#link_original_url[name=?]", "link[original_url]"
      assert_select "input#link_slug[name=?]", "link[slug]"
      assert_select "input#link_clicks[name=?]", "link[clicks]"
      assert_select "input#link_screenshot[name=?]", "link[screenshot]"
      assert_select "input#link_title[name=?]", "link[title]"
    end
  end
end
