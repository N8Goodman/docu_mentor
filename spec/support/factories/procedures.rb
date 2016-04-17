FactoryGirl.define do

  sequence :procedure_name do |n|
    "procedure #{n}"
  end

  factory :procedure do
    procedure_name
    description "A procedure for processing"
    completion_status "Approved"
  end
end
