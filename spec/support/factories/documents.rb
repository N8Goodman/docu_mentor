FactoryGirl.define do

  sequence :document_name do |n|
    "document #{n}"
  end

  factory :document do
    document_name
    description "A document for a stage"
    completion_status "Accepted"
  end
end
