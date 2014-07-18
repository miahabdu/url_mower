require 'spec_helper'

describe "links/show" do
  before(:each) do
    @link = assign(:link, stub_model(Link,
      :original_url => "Original Url",
      :slug => "Slug",
      :clicks => 1,
      :screenshot => "Screenshot",
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Original Url/)
    rendered.should match(/Slug/)
    rendered.should match(/1/)
    rendered.should match(/Screenshot/)
    rendered.should match(/Title/)
  end
end
