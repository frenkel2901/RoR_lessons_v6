class TestPassage < ApplicationRecord

  GREAT = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question

  def completed?
    current_question.nil?
  end

  def successfully_passed?
    percentage_correct_answers >= GREAT
  end

  def number_of_questions
    test.questions.count
  end

  def current_question_number
    test.questions.index(current_question).next
  end

  def percentage_correct_answers
    correct_questions * 100 / test.questions.count.to_f
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.to_a.reject(&:blank?).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  private

  def before_validation_set_current_question
    self.current_question = if new_record?
                              test.questions.first
                            else
                              next_question
                            end
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
