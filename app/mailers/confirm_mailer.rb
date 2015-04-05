class ConfirmMailer < ActionMailer::Base
  default from: "dont-reply@euremoto.com"

  def confirm_email(job)
    @job = job
    mail(to: @job.company_email, subject: 'Confirmação de Cadastro de Vaga')
  end
end
