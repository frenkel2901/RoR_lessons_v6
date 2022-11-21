class User < ApplicationRecord
  has_many :results
  has_many :tests, through: :results
  has_many :made_tests, class_name: "Test"
  
  def my_tests(level)
    Test.joins("JOIN results ON tests.id = results.test_id").where(results: { user_id: id }, level: level)
  end
end
