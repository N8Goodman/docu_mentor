class Document < ActiveRecord::Base
  has_many :occurences
  has_many :stages, through: :occurences
  has_many :uploads

  validates :document_name, presence: true, uniqueness: true
  validates :completion_status, presence: true
end
