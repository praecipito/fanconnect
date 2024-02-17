class Fan::FavoriteFoodsController < ApplicationController
  def new
    @favorite_food = Fan::FavoriteFood.new
  end

  def create
    @favorite_food = Fan::FavoriteFood.new(favorite_food_params)
    if @favorite_food.valid?
      # atualizar usuario com o vlor vindo do form
      # Como o profile vai pertencer à um usuário. acessamos o profile do user
      # e atualizamos o campo desejado
      @profile = current_user.profile
      @profile.update(favorite_food: @favorite_food)
      # redirect_to new_fan_age_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def favorite_food_params
    params.require(:fan_favorite_food).permit(:string)
  end
end
