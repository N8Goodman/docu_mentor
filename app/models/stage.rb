class Stage < ActiveRecord::Base
  has_many :materials
  has_many :levels
  has_many :procedures, through: :levels
  has_many :documents, through: :materials
  has_many :steps

  validates :stage_name, presence: true, uniqueness: true
  validates :completion_status, presence: true
end
