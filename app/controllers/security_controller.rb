class SecurityController < ApplicationController

  def active
    @job = Job.where(token: params['token']).first
    if @job
      @job.confirm
      @job.save
      flash[:notice] = "Parabéns sua vaga foi divulgada com sucesso."
      return render template: "jobs/show"
    end

    render not_found
  end

end
