class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.string :type
      t.integer :quantity
      t.integer :salary
      t.string :headquartes
      t.string :apply

      t.timestamps
    end
  end
end
