class Fan::NumberOfChildrenController < ApplicationController
  def new
    @number_of_child = Fan::NumberOfChild.new
  end

  def create
    @number_of_child = Fan::NumberOfChild.new(number_of_child_params)
    if @number_of_child.valid?
      @profile = current_user.profile
      @profile.update(number_of_children: @number_of_child.number.to_i)
      redirect_to new_fan_income_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def number_of_child_params
    params.require(:fan_number_of_child).permit(:number)
  end
end
