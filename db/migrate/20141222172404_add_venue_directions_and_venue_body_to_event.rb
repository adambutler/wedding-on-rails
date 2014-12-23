class AddVenueDirectionsAndVenueBodyToEvent < ActiveRecord::Migration
  def change
    add_column :events, :venue_body, :text
    add_column :events, :venue_directions, :text
  end
end
