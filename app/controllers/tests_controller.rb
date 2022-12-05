class TestsController < ApplicationController
  def index
    result = ["#{params.class}, #{params.inspect}"]
    render plain: result
  end
end
