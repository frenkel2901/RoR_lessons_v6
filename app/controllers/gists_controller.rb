class GistsController < ApplicationController

  before_action :set_test_passage, only: %i[new create]

  def new
    @gist = @test_passage.current_question.gists.new
  end

  def create
    response = GistQuestionService.new(@test_passage.current_question).call
    @gist = @test_passage.current_question.gists.new(question_id: @test_passage.current_question.id, url: 123, user_id: current_user.id)

    flash_options = if @gist.save
      { notice: "Gist created"}
    else
      { alert: "Error"}
    end
    
    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end

end
