class User < ApplicationRecord
  has_many :apps
  has_many :steps
  has_many :uploads
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
