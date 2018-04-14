class UserMailer < ApplicationMailer

  default from: "railscastttt@example.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signupconfirmation.subject
  #
  def signupconfirmation(viewer)
    @viewer = viewer

    mail to: viewer.email,subject: "sign up confirmation"
  end
end
