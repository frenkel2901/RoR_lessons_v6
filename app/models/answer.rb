class Answer < ApplicationRecord
  MAX_ANS = 4

  belongs_to :question

  validates :body, presence: true
  validate :validate_max_ans, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_max_ans
    errors.add(:answer) if question.answers.count >= MAX_ANS
  end
end
