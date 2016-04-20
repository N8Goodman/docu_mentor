class Step < ActiveRecord::Base
  belongs_to :user
  belongs_to :app
  belongs_to :stage
  has_many :uploads

  validates :user, presence: true
  validates :app, presence: true
  validates :stage, presence: true
end
