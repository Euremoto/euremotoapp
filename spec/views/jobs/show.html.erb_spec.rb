require 'rails_helper'

RSpec.describe "jobs/show", :type => :view do
  before(:each) do
    @job = assign(:job, Job.create!(
      :title => "Title",
      :description => "MyText",
      :type => "Type",
      :quantity => 1,
      :salary => 2,
      :headquartes => "Headquartes",
      :apply => "Apply"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Headquartes/)
    expect(rendered).to match(/Apply/)
  end
end
