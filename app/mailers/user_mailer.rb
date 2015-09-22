class UserMailer < ActionMailer::Base
  include Devise::Mailers::Helpers
  default from: 'notifications@example.com'

  def leader_email(user,group_name)
    @user = user
    @group_name  = group_name
    mail(to: @user.email, subject: 'Leader Log In')
  end
end
