class Photo < ActiveRecord::Base
  belongs_to :event
  has_many :event_notifications
  mount_uploader :file, PhotoUploader
  paginates_per 20
  default_scope { order('created_at DESC') }
end
