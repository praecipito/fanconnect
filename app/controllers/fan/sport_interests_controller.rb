class Fan::SportInterestsController < ApplicationController
  def new
    @sport_interest = Fan::SportInterest.new
  end

  def create
    @sport_interest = Fan::SportInterest.new(sport_interest_params)
    if @sport_interest.valid?
      # atualizar usuario com o vlor vindo do form
      # Como o profile vai pertencer à um usuário. acessamos o profile do user
      # e atualizamos o campo desejado
      @profile = current_user.profile
      @profile.update(sport_interest: @sport_interest)
      # redirect_to new_fan_age_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def sport_interest_params
    params.require(:fan_sport_interest).permit(:string)
  end
end
