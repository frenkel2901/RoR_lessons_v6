module QuestionsHelper
  def question_header(question)
    if question.persisted?
      "Edit '#{question.test.title}' #{question.class} "
    else
      "Create New '#{question.test.title}' #{question.class} "
    end
  end
end
