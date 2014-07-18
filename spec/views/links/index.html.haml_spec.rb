require 'spec_helper'

describe "links/index" do
  before(:each) do
    assign(:links, [
      stub_model(Link,
        :original_url => "Original Url",
        :slug => "Slug",
        :clicks => 1,
        :screenshot => "Screenshot",
        :title => "Title"
      ),
      stub_model(Link,
        :original_url => "Original Url",
        :slug => "Slug",
        :clicks => 1,
        :screenshot => "Screenshot",
        :title => "Title"
      )
    ])
  end

  it "renders a list of links" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Original Url".to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Screenshot".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
