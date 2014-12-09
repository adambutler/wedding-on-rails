class VenuePhoto < ActiveRecord::Base
  belongs_to :event
  mount_uploader :file, VenuePhotoUploader

  def primary?
    id == event.primary_venue_photo
  end
end
