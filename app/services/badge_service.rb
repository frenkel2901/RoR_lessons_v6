class BadgeService

  RULES = {
    category?: CategoryRuleSpecification,
    level?: LevelRuleSpecification,
    attempt?: AttemptRuleSpecification
  }.freeze

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @current_test = test_passage.test
  end

  def call
    Badge.find_each do |badge|
      rule = RULES[badge.rule.to_sym].new(@user, @current_test, @test_passage)
      @user.badges << badge if rule.satisfied?
    end
  end
end
