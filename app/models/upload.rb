class Upload < ActiveRecord::Base
  belongs_to :user
  belongs_to :step
  belongs_to :document
  belongs_to :app

  mount_uploader :document_file, DocumentFilesUploader

  validates :user, presence: true
  validates :step, presence: true
  validates :document, presence: true
  validates :app, presence: true
end
