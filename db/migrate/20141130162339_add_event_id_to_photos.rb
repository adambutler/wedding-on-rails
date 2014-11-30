class AddEventIdToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :event_id, :integer
  end
end
