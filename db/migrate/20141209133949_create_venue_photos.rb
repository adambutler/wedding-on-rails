class CreateVenuePhotos < ActiveRecord::Migration
  def change
    create_table :venue_photos do |t|
      t.string :file
      t.integer :event_id

      t.timestamps
    end
  end
end
