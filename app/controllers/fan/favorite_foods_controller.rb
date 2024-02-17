class Fan::FavoriteFoodsController < ApplicationController
  def new
    @favorite_food = Fan::FavoriteFood.new
  end

  def create
    @favorite_food = Fan::FavoriteFood.new(favorite_food_params)
    if @favorite_food.valid?
      @profile = current_user.profile
      @profile.update(favorite_food: @favorite_food)
      redirect_to new_fan_favorite_videogame_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def favorite_food_params
    params.require(:fan_favorite_food).permit(:string)
  end
end
