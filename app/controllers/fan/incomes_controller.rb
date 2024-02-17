class Fan::IncomesController < ApplicationController
  def new
    @income = Fan::Income.new
  end

  def create
    @income = Fan::Income.new(income_params)
    if @income.valid?
      @profile = current_user.profile
      @profile.update(minimum_income: @income.renda.split(' a ')[0].to_i)
      @profile.update(maximum_income: @income.renda.split(' a ')[1].to_i)
      redirect_to new_fan_birth_city_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def income_params
    params.require(:fan_income).permit(:renda)
  end
end
