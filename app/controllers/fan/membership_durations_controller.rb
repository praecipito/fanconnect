class Fan::MembershipDurationsController < ApplicationController
  def new
    @membership_duration = Fan::MembershipDuration.new
  end

  def create
    @membership_duration = Fan::MembershipDuration.new(membership_duration_params)
    if @membership_duration.valid?
      @profile = current_user.profile
      @profile.update(membership_duration: @membership_duration.number.to_i)
      redirect_to fan_idol_match_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def membership_duration_params
    params.require(:fan_membership_duration).permit(:number)
  end
end
