class Event < ActiveRecord::Base
  has_many :groups
  has_many :guests
  has_many :photos
  has_many :sections
  has_many :venue_photos

  def days_to_go
    (date.to_time - Time.now).to_i / 1.day
  end

  def formatted_time
    date.strftime("%A #{date.day.ordinalize} %B %Y")
  end

  def in_past?
    date < Time.now
  end
end
