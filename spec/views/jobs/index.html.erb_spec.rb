require 'rails_helper'

RSpec.describe "jobs/index", :type => :view do
  before(:each) do
    assign(:jobs, [
      Job.create!(
        :title => "Title",
        :description => "MyText",
        :type => "Type",
        :quantity => 1,
        :salary => 2,
        :headquartes => "Headquartes",
        :apply => "Apply"
      ),
      Job.create!(
        :title => "Title",
        :description => "MyText",
        :type => "Type",
        :quantity => 1,
        :salary => 2,
        :headquartes => "Headquartes",
        :apply => "Apply"
      )
    ])
  end

  it "renders a list of jobs" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Headquartes".to_s, :count => 2
    assert_select "tr>td", :text => "Apply".to_s, :count => 2
  end
end
