class EventMailer < ApplicationMailer
  def notifications(rsvps, photos)
    @rsvps = rsvps
    @photos = photos
    mail to: "us@hitched.it", subject: "Notification from hitched.it"
  end
end
