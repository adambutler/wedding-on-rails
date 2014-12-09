class VenuePhoto < ActiveRecord::Base
  belongs_to :event
  mount_uploader :file, VenuePhotoUploader
end
