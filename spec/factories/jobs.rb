FactoryGirl.define do
  factory :job, class: Job do
    title "Teste"
    description "Uma linda descricao"
    type "freela"
    apply "teste@teste.com"

    factory :confirmed_job do
      confirm Time.now
    end
  end
end
