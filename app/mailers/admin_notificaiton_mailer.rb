class AdminNotificaitonMailer < ActionMailer::Base
  default from: "no-reply@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_notificaiton_mailer.new_comment.subject
  #
  def new_comment(comment)
    @comment = comment
    @post = comment.post

    mail to: "admin@example.org",
         subject: "[Blog] #{@post.title} got a new comment."
  end
end
