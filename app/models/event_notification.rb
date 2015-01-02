class EventNotification < ActiveRecord::Base
  belongs_to :user
  belongs_to :guest
  belongs_to :photo
end
