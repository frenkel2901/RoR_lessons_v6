class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render inline: '<p>Questions in test <%= @test.id %>: <%= @test.questions %></p>'
  end

  def show
    render inline: '<p>Questions <%= @question.id %>: <%= @question %></p>'
  end

  def new
    @question = @test.questions.new
  end
  
  def create
    @question = @test.questions.new(question_params)
    if @question.save
      render plain: question.inspect
    else
    end
  end

  def destroy
    @question.destroy
    render inline: 'Question <%= params[:id] deleted'
  end

  private

  def question_params
    params.require(:questions).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render inline: 'Question <%= params[:id]%> not found'
  end
end
