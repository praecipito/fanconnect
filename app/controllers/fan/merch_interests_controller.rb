class Fan::MerchInterestsController < ApplicationController
  def new
    @merch_interest = Fan::MerchInterest.new
  end

  def create
    @merch_interest = Fan::MerchInterest.new(merch_interest_params)
    if @merch_interest.valid?
      @profile = current_user.profile
      @profile.update(merchandising_interest: @merch_interest)
      redirect_to new_fan_preferred_channel_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def merch_interest_params
    params.require(:fan_merch_interest).permit(:interesse)
  end
end
