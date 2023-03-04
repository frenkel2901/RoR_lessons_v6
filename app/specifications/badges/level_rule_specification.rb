module Badges
  class LevelRuleSpecification < BadgeSpecifications
    def satisfied?
      level = @option
      return if @test.level != level.to_i

      Test.by_ids(@test_passage.passed_test_ids).by_level(level).count == Test.by_level(level).count
    end
  end
end
