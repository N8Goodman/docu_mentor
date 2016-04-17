class Procedure < ActiveRecord::Base
  has_many :applications
  has_many :appearances
  has_many :stages, through: :appearances
  has_many :users, through: :applications

  validates :procedure_name, presence: true, uniqueness: true
  validates :completion_status, presence: true
end
