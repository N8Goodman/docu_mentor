class Document < ActiveRecord::Base
  has_many :materials, dependent: :destroy
  has_many :stages, through: :materials
  has_many :uploads, dependent: :destroy

  validates :document_name, presence: true, uniqueness: true

  def this_material(stage)
    Material.where(stage: stage).find_by(document: self)
  end
end
