class Fan::BirthCitiesController < ApplicationController
  def new
    @birth_city = Fan::BirthCity.new
  end

  def create
    @birth_city = Fan::BirthCity.new(birth_city_params)
    if @birth_city.valid?
      @profile = current_user.profile
      @profile.update(birth_city: @birth_city)
      redirect_to new_fan_favorite_drink_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def birth_city_params
    params.require(:fan_birth_city).permit(:city)
  end
end
