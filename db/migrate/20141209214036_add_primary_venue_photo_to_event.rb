class AddPrimaryVenuePhotoToEvent < ActiveRecord::Migration
  def change
    add_column :events, :primary_venue_photo, :integer
  end
end
