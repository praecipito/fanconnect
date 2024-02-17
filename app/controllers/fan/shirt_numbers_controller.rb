class Fan::ShirtNumbersController < ApplicationController
  def new
    @shirt_number = Fan::ShirtNumber.new
  end

  def create
    @shirt_number = Fan::ShirtNumber.new(shirt_number_params)
    if @shirt_number.valid?
      # atualizar usuario com o vlor vindo do form
      # Como o profile vai pertencer à um usuário. acessamos o profile do user
      # e atualizamos o campo desejado
      @profile = current_user.profile
      @profile.update(favorite_shirt_number: @shirt_number.number.to_i)
      # redirect_to new_fan_shoe_size
    else
      render :new, status: :unprocessable_entity
    end

  end

  def search
    @player = Player.where(favorite_shirt_number: params[:number])
    respond_to do |format|
      if @player.present?
        format.json { render json: @player.first }
      else
        format.json { render json: { shirt_name: 'Abel Ferreira', position: 'Técnico', upper_image_url: "https://sep-bucket-prod.s3.amazonaws.com/wp-content/uploads/2024/01/0015_ABEL-FERREIRA.psd.png" }}
      end
    end
  end

  private

  def shirt_number_params
    params.require(:fan_shirt_number).permit(:number)
  end
end
