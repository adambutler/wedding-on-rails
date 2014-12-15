class TaskList < ActiveRecord::Base
  belongs_to :event
  has_many :tasks

  after_create :generate_default_tasks

  private

  def generate_default_tasks
    tasks = YAML::load(File.open("#{Rails.root}/config/tasks.yml"))
    tasks.each do |task|
      Task.create({
        event_id: event_id,
        task_list_id: id,
        completed: false,
        description: task
      })
    end
  end
end
