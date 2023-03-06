class LevelRuleSpecification < BadgeRulesService

  def satisfied?
    tests_by_level = Test.tests_by_level(@level).pluck(:id)
    all_passed_users_tests = @user.test_passages.where(passed: true).pluck(:test_id)
    (all_passed_users_tests.uniq - tests_by_level).size == all_passed_users_tests.uniq.size - tests_by_level.size
  end
end
