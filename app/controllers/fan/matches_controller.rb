class Fan::MatchesController < ApplicationController
  def show
    @profile = current_user.profile
    @best_match = current_user.find_best_match(Player.all)
  end
end
