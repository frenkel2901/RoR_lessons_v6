class BadgeService

  RULES = {
    category?: Badges::CategoryRuleSpecification,
    level?: Badges::LevelRuleSpecification,
    attempt?: Badges::AttemptRuleSpecification
  }.freeze
  
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
    @badges = Badge.all
  end

  def call
    Badge.find_each do |badge|
      rule = RULES[badge.rule_name.to_sym].new(@test_passage, badge.rule_value)
      @test_passage.user.badges.push(badge) if rule.satisfied?
    end
  end
end
