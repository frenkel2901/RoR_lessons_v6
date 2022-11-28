class Answer < ApplicationRecord
  MAX_ANS = 4

  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, persence: true
  validate :validate_max_ans

  def validate_max_ans
    errors.add(:answer) if question.answers.count > MAX_ANS
  end
end
