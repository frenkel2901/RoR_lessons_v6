class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests, through: :results, dependent: :destroy
  has_many :made_tests, class_name: 'Test', dependent: :destroy

  validates :mail, presence: true
  validates :name, presence: true
  
  def my_tests(level)
    tests.where(level: level)
  end
end
