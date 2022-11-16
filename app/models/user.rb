class User < ApplicationRecord
  def my_tests(level)
    Test.joins("JOIN results ON tests.id = results.test_id").where(results: { user_id: id }, level: level)
      .pluck(:title)
  end
end
