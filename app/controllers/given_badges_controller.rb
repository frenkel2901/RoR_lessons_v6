class GivenBadgesController < ApplicationController
  def index
    @given_badges = current_user.badges
  end
end
