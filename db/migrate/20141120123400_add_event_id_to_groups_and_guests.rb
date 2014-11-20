class AddEventIdToGroupsAndGuests < ActiveRecord::Migration
  def change
    add_column :groups, :event_id, :integer
    add_column :guests, :event_id, :integer
  end
end
