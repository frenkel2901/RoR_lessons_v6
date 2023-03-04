class BadgeSpecifications
  def initialize(test_passage, option)
    @option = option
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end
end
