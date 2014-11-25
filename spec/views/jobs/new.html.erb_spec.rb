require 'rails_helper'

RSpec.describe "jobs/new", :type => :view do
  before(:each) do
    assign(:job, Job.new(
      :title => "MyString",
      :description => "MyText",
      :type => "",
      :quantity => 1,
      :salary => 1,
      :headquartes => "MyString",
      :apply => "MyString"
    ))
  end

  it "renders new job form" do
    render

    assert_select "form[action=?][method=?]", jobs_path, "post" do

      assert_select "input#job_title[name=?]", "job[title]"

      assert_select "textarea#job_description[name=?]", "job[description]"

      assert_select "input#job_type[name=?]", "job[type]"

      assert_select "input#job_quantity[name=?]", "job[quantity]"

      assert_select "input#job_salary[name=?]", "job[salary]"

      assert_select "input#job_headquartes[name=?]", "job[headquartes]"

      assert_select "input#job_apply[name=?]", "job[apply]"
    end
  end
end
