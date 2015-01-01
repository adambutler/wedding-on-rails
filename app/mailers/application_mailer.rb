class ApplicationMailer < ActionMailer::Base
  layout "mailer"
  default from: "notifications@hitched.it"
end
