class Fan::WeightsController < ApplicationController
  def new
    @weight = Fan::Weight.new
  end

  def create
    @weight = Fan::Weight.new(weight_params)
    if @weight.valid?
      @profile = current_user.profile
      @profile.update(weight: @weight.number.to_i)
      redirect_to new_fan_sport_interest_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def weight_params
    params.require(:fan_weight).permit(:number)
  end
end
