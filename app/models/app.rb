class App < ActiveRecord::Base
  belongs_to :procedure
  belongs_to :user

  validates :procedure, presence: true
  validates :user, presence: true
  validates :user, uniqueness: {
    scope: :procedure,
    message: "you have already started this app!"
  }
end
