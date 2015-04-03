module JobsHelper

  def new_job?(job)
    job.created_at >= 5.days.ago
  end

end
