class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGury" <mail@testguru.com}
  layout 'mailer'
end
