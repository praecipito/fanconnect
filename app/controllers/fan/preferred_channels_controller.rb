class Fan::PreferredChannelsController < ApplicationController
  def new
    @preferred_channel = Fan::PreferredChannel.new
  end

  def create
    @preferred_channel = Fan::PreferredChannel.new(preferred_channel_params)
    if @preferred_channel.valid?
      @profile = current_user.profile
      @profile.update(preferred_communication_channel: @preferred_channel.string)
      redirect_to new_fan_membership_duration_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def preferred_channel_params
    params.require(:fan_preferred_channel).permit(:string)
  end
end
