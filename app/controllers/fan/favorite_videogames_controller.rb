class Fan::FavoriteVideogamesController < ApplicationController
  def new
    @favorite_videogame = Fan::FavoriteVideogame.new
  end

  def create
    @favorite_videogame = Fan::FavoriteVideogame.new(favorite_videogame_params)
    if @favorite_videogame.valid?
      @profile = current_user.profile
      @profile.update(favorite_videogame: @favorite_videogame.string)
      redirect_to new_fan_merch_interest_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def favorite_videogame_params
    params.require(:fan_favorite_videogame).permit(:string)
  end
end
