class Fan::FavoriteDrinksController < ApplicationController
  def new
    @favorite_drink = Fan::FavoriteDrink.new
  end

  def create
    @favorite_drink = Fan::FavoriteDrink.new(favorite_drink_params)
    if @favorite_drink.valid?
      @profile = current_user.profile
      @profile.update(favorite_drink: @favorite_drink)
      redirect_to new_fan_favorite_food_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def favorite_drink_params
    params.require(:fan_favorite_drink).permit(:string)
  end
end
