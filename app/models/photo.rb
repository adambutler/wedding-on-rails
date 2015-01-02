class Photo < ActiveRecord::Base
  belongs_to :event
  has_many :event_notifications
  mount_uploader :file, PhotoUploader
end
