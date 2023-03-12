class AttemptRuleSpecification < BadgeRulesService

  def satisfied?
    current_test_passages = @user_passages.where(test_id: @test.id)
    current_test_passages.count == 1 && @test_passage.successfully_passed?
  end
end
