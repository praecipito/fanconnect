class Fan::ShirtNumbersController < ApplicationController
  def new
    @shirt_number = Fan::ShirtNumber.new
  end

  def create
    @shirt_number = Fan::ShirtNumber.new(shirt_number_params)
    if @shirt_number.valid?
      # atualizar usuario com o vlor vindo do form
      # Como o profile vai pertencer à um usuário. acessamos o profile do user
      # e atualizamos o campo desejado
      @profile = current_user.profile
      @profile.update(favorite_shirt_number: @shirt_number.number.to_i)
      # redirect_to new_fan_age_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def shirt_number_params
    params.require(:fan_shirt_number).permit(:number)
  end
end
