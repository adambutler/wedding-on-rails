class Event < ActiveRecord::Base
  has_many :groups
  has_many :guests
  has_many :photos
  has_many :sections
  has_many :task_lists
  has_many :tasks
  has_many :venue_photos

  after_create :create_event_task_list

  def days_to_go
    (date.to_time - Time.now).to_i / 1.day
  end

  def formatted_time
    date.strftime("%A #{date.day.ordinalize} %B %Y")
  end

  def in_past?
    date < Time.now
  end

  private

  def create_event_task_list
    TaskList.create({event_id: id})
  end
end
