class Icon < ActiveRecord::Base
  has_many :uploads

  validates :name, presence: true
  validates :icon_img, presence: true
end
