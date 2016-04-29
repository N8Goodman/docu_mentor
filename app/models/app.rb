class App < ActiveRecord::Base
  belongs_to :procedure
  belongs_to :user
  has_many :steps, -> { order('steps.order asc') }
  has_many :uploads

  validates :procedure, presence: true
  validates :active_stage, presence: true, numericality: true
  validates :user, presence: true
  validates :user, presence: true
  validates :user, uniqueness: {
    scope: :procedure,
    message: "you have already started this app!"
  }

  delegate :levels, to: :procedure

  def completed?
    if self.active_stage > self.steps.length
      self.completed = true
    end
  end
end
