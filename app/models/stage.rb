class Stage < ActiveRecord::Base
  has_many :materials, dependent: :destroy
  has_many :levels, dependent: :destroy
  has_many :procedures, through: :levels
  has_many :documents, through: :materials
  has_many :steps, dependent: :destroy

  validates :stage_name, presence: true, uniqueness: true

  def this_level(procedure)
    Level.where(procedure: procedure).find_by(stage: self)
  end
end
