class Material < ActiveRecord::Base
  belongs_to :document
  belongs_to :stage

  validates :document, presence: true
  validates :stage, presence: true
  validates :stage, uniqueness: {
    scope: :document,
    message: "already contains document!"
  }
  validates :document, uniqueness: {
    scope: :stage,
    message: " is already included!"
  }
end
