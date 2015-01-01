class CreateEventNotifications < ActiveRecord::Migration
  def change
    create_table :event_notifications do |t|
      t.string :notification_type
      t.integer :guest_id
      t.integer :event_id

      t.timestamps
    end
  end
end
