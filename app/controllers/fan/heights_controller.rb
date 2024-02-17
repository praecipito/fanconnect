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

  def search
    @player = Player.where(height: params[:number].to_i)
    respond_to do |format|
      if @player.present?
        format.json { render json: @player.sample }
      else
        format.json { render json: { shirt_name: 'Abel Ferreira', position: 'Técnico', body_image_url: "https://sep-bucket-prod.s3.amazonaws.com/wp-content/uploads/2024/01/0015_ABEL-FERREIRA.psd.png" }}
      end
    end
  end

  private

  def height_params
    params.require(:fan_height).permit(:number)
  end
end
