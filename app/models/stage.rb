class Stage < ActiveRecord::Base
  has_many :occurences
  has_many :appearances
  has_many :procedures, through: :appearances
  has_many :documents, through: :occurences
  has_many :steps

  validates :stage_name, presence: true, uniqueness: true
  validates :completion_status, presence: true
end
