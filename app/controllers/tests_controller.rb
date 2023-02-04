class TestsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_test, only: %i[show start edit update destroy]

  def index
    @tests = Test.all
  end

  def show; end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.made_tests.build(test_params)
    @test.author = current_user
    if @test.save
      redirect_to @test, notice: "Test was successfully created!"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end
  
  private

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
