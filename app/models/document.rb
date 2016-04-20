class Document < ActiveRecord::Base
  has_many :materials, dependent: :destroy
  has_many :stages, through: :materials
  has_many :uploads

  validates :document_name, presence: true, uniqueness: true
  validates :completion_status, presence: true
end
