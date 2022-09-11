class PlantcardsController < ApplicationController
  before_action :authenticate_user

  def show
    @tipos  = Tipo.all
    @plants = Plant.all
    @plant      = Plant.find(params[:id])
    @plantcard  = Plantcard.find(params[:id])
    @seed   = @plant.tipo_id
    @result = @tipos.where(id: @seed)
    @contents = Content.all
    @content = @contents.where(id: @plantcard)
  end

  private

  def set_plantcard
    @plantcard = Plantcard.find(params[:id])
  end

  def plantcard_params
    params.require(:plantcard).permit(:plant_id, :title)
  end
end
