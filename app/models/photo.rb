class Photo < ActiveRecord::Base
  belongs_to :event
  mount_uploader :file, PhotoUploader
end
