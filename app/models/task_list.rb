class TaskList < ActiveRecord::Base
  belongs_to :event
  has_many :tasks
end
