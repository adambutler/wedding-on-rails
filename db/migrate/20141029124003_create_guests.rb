class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :name
      t.boolean :rsvp
      t.boolean :invited_to_ceremony
      t.boolean :invited_to_evening
      t.boolean :vegetarian
      t.integer :group_size
      t.boolean :arrival_transportation_required
      t.boolean :departing_transport_requred

      t.timestamps
    end
  end
end
