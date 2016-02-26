class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@crowdfunder.com"
  layout 'mailer'
end
