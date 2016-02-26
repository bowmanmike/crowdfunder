class UserMailer < ApplicationMailer
  default from: "no-reply@crowdfunder.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to Crowdfunder, #{@user.first_name}")
  end

  def notify_fully_funded(user, project)
    @user = user
    @project = project
    mail(to: @user.email, subject: "#{@project.name} has reached its funding goal!")
  end

end
