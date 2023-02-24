class FeedbacksMailer < ApplicationMailer

  def send_feedback(current_user, comment)
    @email = current_user.email
    @comment = comment
    @admin_email = ENV['ADMIN_EMAIL']
    mail to: @admin_email, subject: "Сообщение от пользователя #{@email}"
  end

end
