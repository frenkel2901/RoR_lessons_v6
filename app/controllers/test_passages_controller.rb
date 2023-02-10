class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show result update gist]

  def show; end

  def result; end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
    gist = current_user.gists.create(question_id: @test_passage.current_question.id, url: result.html_url)

    if gist.save
      redirect_to @test_passage, notice: t('.success', link: view_context.link_to(result.html_url)).html_safe
    else
      redirect_to @test_passage, alert: t('.failure')
    end

  end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
