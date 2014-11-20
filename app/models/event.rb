class Event < ActiveRecord::Base
  has_many :groups
  has_many :guests

  def days_to_go
    (date.to_time - Time.now).to_i / 1.day
  end

  def formatted_time
    date.strftime("%A #{date.day.ordinalize} %B %Y")
  end

end
