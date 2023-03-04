module Badges
  class CategoryRuleSpecification < BadgeSpecifications
    def satisfied?
      return if @test.category.title != @option

      category = @test.category_id
      Test.by_ids(@test_passage.passed_test_ids).by_category_id(category).count == Test.by_category_id(category).count
    end
  end
end
