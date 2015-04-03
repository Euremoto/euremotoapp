json.array!(@jobs) do |job|
  json.extract! job, :id, :title, :description, :type, :quantity, :salary, :headquartes, :apply
  json.url job_url(job, format: :json)
end
