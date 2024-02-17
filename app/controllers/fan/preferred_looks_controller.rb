class Fan::PreferredLooksController < ApplicationController
  def new
    @preferred_look = Fan::PreferredLook.new
  end

  def create
    @preferred_look = Fan::PreferredLook.new(preferred_look_params)
    raise
    if @preferred_look.valid?
      # atualizar usuario com o vlor vindo do form
      # Como o profile vai pertencer à um usuário. acessamos o profile do user
      # e atualizamos o campo desejado
      @profile = current_user.profile
      @profile.update(preferred_look: @preferred_look)
      # redirect_to new_fan_age_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def preferred_look_params
    params.require(:fan_preferred_look).permit(:string)
  end
end
