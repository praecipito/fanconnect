class Fan::ShoeSizesController < ApplicationController
  def new
    @shoe_size = Fan::ShoeSize.new
  end

  def create
    @shoe_size = Fan::ShoeSize.new(shoe_size_params)
    if @shoe_size.valid?
      @profile = current_user.profile
      @profile.update(shoe_size: @shoe_size.number.to_i)
      redirect_to new_fan_height_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def shoe_size_params
    params.require(:fan_shoe_size).permit(:number)
  end
end
