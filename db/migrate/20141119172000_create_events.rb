class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :time
      t.string :location
      t.boolean :active
      t.string :title

      t.timestamps
    end
  end
end
