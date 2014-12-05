class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :title
      t.text :content
      t.integer :event_id

      t.timestamps
    end
  end
end
