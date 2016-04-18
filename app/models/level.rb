class Level < ActiveRecord::Base
  belongs_to :procedure
  belongs_to :stage

  validates :procedure, presence: true
  validates :stage, presence: true
  validates :procedure, uniqueness: {
    scope: :stage,
    message: "already contains stage!"
  }
end
