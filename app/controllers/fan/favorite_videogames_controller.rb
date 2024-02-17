class Fan::FavoriteVideogamesController < ApplicationController
  def new
    @favorite_videogame = Fan::FavoriteVideogame.new
  end

  def create
    @favorite_videogame = Fan::FavoriteVideogame.new(favorite_videogame_params)
    if @favorite_videogame.valid?
      # atualizar usuario com o vlor vindo do form
      # Como o profile vai pertencer à um usuário. acessamos o profile do user
      # e atualizamos o campo desejado
      @profile = current_user.profile
      @profile.update(favorite_videogame: @favorite_videogame)
      # redirect_to new_fan_age_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def favorite_videogame_params
    params.require(:fan_favorite_videogame).permit(:string)
  end
end
