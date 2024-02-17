class Fan::PreferredChannelsController < ApplicationController
  def new
    @preferred_channel = Fan::PreferredChannel.new
  end

  def create
    @preferred_channel = Fan::PreferredChannel.new(preferred_channel_params)
    if @preferred_channel.valid?
      # atualizar usuario com o vlor vindo do form
      # Como o profile vai pertencer à um usuário. acessamos o profile do user
      # e atualizamos o campo desejado
      @profile = current_user.profile
      @profile.update(preferred_communication_channel: @preferred_channel)
      # redirect_to new_fan_age_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def preferred_channel_params
    params.require(:fan_preferred_channel).permit(:prefiro)
  end
end
