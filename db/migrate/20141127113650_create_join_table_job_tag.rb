class CreateJoinTableJobTag < ActiveRecord::Migration
  def change
    create_join_table :jobs, :tags do |t|
      # t.index [:job_id, :tag_id]
      # t.index [:tag_id, :job_id]
    end
  end
end
