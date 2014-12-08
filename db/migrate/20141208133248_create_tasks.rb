class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :event_id
      t.integer :task_list_id
      t.boolean :completed
      t.string :description

      t.timestamps
    end
  end
end
