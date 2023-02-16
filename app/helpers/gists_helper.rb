module GistsHelper
  BODY_LENGTH = 25

  def question_link(question)
    link_to question.body.truncate(BODY_LENGTH), admin_question_path(question)
  end

end
