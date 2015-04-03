class AddTokenAndConfirmToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :token, :string
    add_column :jobs, :confirm, :time
  end
end
