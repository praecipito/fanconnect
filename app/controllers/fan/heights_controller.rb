class Fan::HeightsController < ApplicationController
  def new
    @height = Fan::Height.new
  end

  def create
    @height = Fan::Height.new(height_params)
    if @height.valid?
      @profile = current_user.profile
      @profile.update(height: @height.number.to_i)
      redirect_to new_fan_shirt_number_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def height_params
    params.require(:fan_height).permit(:number)
  end
end
