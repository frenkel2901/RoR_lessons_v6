class BadgeRulesService

  def initialize(current_user, current_test, test_passage)
    @user = current_user
    @test = current_test
    @test_passage = test_passage
    @category = @test.category
    @level = @test.level
    @user_passages = @user.test_passages
  end
end
