class AddPhotoIdToEventNotification < ActiveRecord::Migration
  def change
    add_column :event_notifications, :photo_id, :integer
  end
end
