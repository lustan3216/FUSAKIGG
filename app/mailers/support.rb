class Support < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.support.notify_comment.subject
  #
  default :from => "foobar@example.org"

  def notify_comment(user, comment)
    @comment = comment
    mail(:to => user.email, :subject => "New Comment")
  end
end
