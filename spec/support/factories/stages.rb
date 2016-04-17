FactoryGirl.define do

  sequence :stage_name do |n|
    "stage #{n}"
  end

  factory :stage do
    stage_name
    description "A stage of a procedure"
    completion_status "Approved?"
  end
end
