class Fan::BirthCitiesController < ApplicationController
  def new
    @birth_city = Fan::BirthCity.new
  end

  def create
    @birth_city = Fan::BirthCity.new(birth_city_params)
    if @birth_city.valid?
      # atualizar usuario com o vlor vindo do form
      # Como o profile vai pertencer à um usuário. acessamos o profile do user
      # e atualizamos o campo desejado
      @profile = current_user.profile
      @profile.update(birth_city: @birth_city)
      # redirect_to new_fan_age_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def birth_city_params
    params.require(:fan_birth_city).permit(:city)
  end
end
