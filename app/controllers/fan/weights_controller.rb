class Fan::WeightsController < ApplicationController
  def new
    @weight = Fan::Weight.new
  end

  def create
    @weight = Fan::Weight.new(weight_params)
    # raise
    if @weight.valid?
      # atualizar usuario com o vlor vindo do form
      # Como o profile vai pertencer à um usuário. acessamos o profile do user
      # e atualizamos o campo desejado
      @profile = current_user.profile
      @profile.update(favorite_weight: @weight.number.to_i)
      # redirect_to new_fan_age_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def weight_params
    params.require(:fan_weight).permit(:number)
  end
end
