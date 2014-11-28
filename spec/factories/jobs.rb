FactoryGirl.define do
  factory :job, class: Job do
    title "Teste"
    description "Uma linda descricao"
    company_name "Yeapiz"
    company_email "teste@teste.com"
    job_type "freela"
    apply "teste@teste.com"

    factory :confirmed_job do
      confirm Time.now
    end

    factory :old_job do
      created_at 30.days.ago
    end
  end
end
