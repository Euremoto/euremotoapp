class AddCompanyNameAndUrlAndCompanyEmailToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :company_name, :string
    add_column :jobs, :url, :string
    add_column :jobs, :company_email, :string
  end
end
