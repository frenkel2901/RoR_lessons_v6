class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :made_tests, class_name: 'Test', foreign_key: :author_id, dependent: :destroy

  validates :mail, presence: true
  validates :name, presence: true

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
  
  def my_tests(level)
    tests.where(level: level)
  end
end
