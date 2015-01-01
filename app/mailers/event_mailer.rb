class EventMailer < ApplicationMailer
  def notifications(rsvps)
    @rsvps = rsvps
    mail to: "us@hitched.it", subject: "Notification from hitched.it"
  end
end
