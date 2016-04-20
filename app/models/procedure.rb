class Procedure < ActiveRecord::Base
  has_many :apps
  has_many :levels, dependent: :destroy
  has_many :stages, -> { order('levels.order asc') }, through: :levels
  has_many :users, through: :apps

  validates :procedure_name, presence: true, uniqueness: true
  validates :completion_status, presence: true
end
