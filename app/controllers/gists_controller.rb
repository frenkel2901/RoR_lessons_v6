class GistsController < ApplicationController

  before_action :set_test_passage, only: %i[create]

  def create
    result = GistQuestionService.new(@test_passage).call

    link = helpers.link_to "Gist created", result.url, target: "_blank"

    flash_options = if result.present?
      { notice: t(".success", link: link) }
    else
      { notice: t(".failure") }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:test_passage])
  end

end
