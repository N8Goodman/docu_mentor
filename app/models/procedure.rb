class Procedure < ActiveRecord::Base
  has_many :apps
  has_many :levels
  has_many :stages, through: :levels
  has_many :users, through: :applications

  validates :procedure_name, presence: true, uniqueness: true
  validates :completion_status, presence: true
end
