class GistsController < ApplicationController

  before_action :set_test_passage, only: %i[create]

  def create
    response = GistQuestionService.new(@test_passage).call

    #gist = current_user.gists.create(question_id: @test_passage.current_question.id, url: response.html_url) if response.present?

    link = helpers.link_to "Gist created", response.url, target: "_blank"

    flash_options = if response.present?
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
