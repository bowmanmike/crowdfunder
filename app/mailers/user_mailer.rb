class UserMailer < ApplicationMailer
  default from: "projectfunding@crowdfunder.com"

  def notify_fully_funded(user, project)
    @user = user
    @project = project
    mail(to: @user.email, subject: "#{@project.name} has reached its funding goal!")
  end
end
