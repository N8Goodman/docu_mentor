FactoryGirl.define do

  sequence :name do |n|
    "procedure #{n}"
  end

  factory :procedure do
    name
    description "A procedure for processing"
    completion_status "Approved?"
  end
end
