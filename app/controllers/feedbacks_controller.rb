class FeedbacksController < ApplicationController

  def create
    unless params[:comment].nil?
      FeedbackMailer.send_feedback(current_user, params[:comment]).deliver_now
      redirect_to root_path, { notice: "Сообщение отправлено" }
    end
  end

end
