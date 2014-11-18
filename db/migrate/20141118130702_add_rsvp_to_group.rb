class AddRsvpToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :rsvp, :boolean, default: false
  end
end
