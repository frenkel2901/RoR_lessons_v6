class CategoryRuleSpecification < BadgeRulesService

  def satisfied?
    tests_in_category = Test.tests_by_category(@category).pluck(:id)
    all_passed_users_tests = @user_passages.where(passed: true).pluck(:test_id)
    (all_passed_users_tests.uniq - tests_in_category).size == all_passed_users_tests.uniq.size - tests_in_category.size
  end
end
