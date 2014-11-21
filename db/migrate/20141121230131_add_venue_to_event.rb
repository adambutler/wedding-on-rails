class AddVenueToEvent < ActiveRecord::Migration
  def change
    add_column :events, :venue_name, :string
    add_column :events, :venue_address_line_one, :string
    add_column :events, :venue_address_line_two, :string
    add_column :events, :venue_address_city, :string
    add_column :events, :venue_address_state, :string
    add_column :events, :venue_address_zip, :string
    add_column :events, :venue_address_country, :string
  end
end
