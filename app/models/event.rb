class Event < ActiveRecord::Base
  has_many :groups
  has_many :guests
  has_many :photos
  has_many :sections
  has_many :task_lists
  has_many :tasks
  has_many :venue_photos
  has_many :event_notifications

  after_create :create_event_task_list

  def days_to_go
    (Event.last.date - Date.today).to_int.clamp(0, Float::INFINITY)
  end

  def formatted_time
    date.strftime("%A #{date.day.ordinalize} %B %Y")
  end

  def in_past?
    date < Date.today
  end

  def is_today?
    date == Date.today
  end

  def show_photos?
    return true if params[:development]
    return true if Rails.env == "development"
    return true if in_past?
    return true if is_today?
  end

  def self.send_notifications(id)
    find(id).send_notifications
  end

  def send_notifications
    rsvps = Event.first.event_notifications.where(notification_type: "rsvp")
    photos = Event.first.event_notifications.where(notification_type: "photo_upload")
    unless rsvps.empty? and photos.empty?
      if EventMailer.notifications(rsvps, photos).deliver
        rsvps.destroy_all
        photos.destroy_all
      end
    end
  end

  private

  def create_event_task_list
    TaskList.create({event_id: id})
  end
end
