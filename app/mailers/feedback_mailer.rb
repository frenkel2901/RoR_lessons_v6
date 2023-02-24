class FeedbacksMailer < ApplicationMailer

  def send_feedback(current_user, comment)
    @user = current_user
    @comment = comment
    @admin_email = ENV['ADMIN_EMAIL']
    mail to: @admin_email, subject: "Сообщение от пользователя #{@user.email}"
  end

end
