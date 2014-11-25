require 'rails_helper'

RSpec.describe "jobs/edit", :type => :view do
  before(:each) do
    @job = assign(:job, Job.create!(
      :title => "MyString",
      :description => "MyText",
      :type => "",
      :quantity => 1,
      :salary => 1,
      :headquartes => "MyString",
      :apply => "MyString"
    ))
  end

  it "renders the edit job form" do
    render

    assert_select "form[action=?][method=?]", job_path(@job), "post" do

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
