json.array!(@programmers, @designers) do |job|
  json.extract! job, :id, :title, :description, :job_type, :quantity, :salary, :headquartes, :apply, :company_name
  json.url job_url(job, format: :json)
end
