class TiposController < ApplicationController

  def index
    @especies = Tipo.all
    @plants  = Plant.all
  end

  def show
    @especie = Tipo.find(params[:id])
    @these_plants = Plant.where(tipo_id: @especie)
  end

  private

  def set_tipo
    @tipo = Tipo.find(params[:id])
  end

  def tipo_params
    params.require(:tipo).permit(:especie)
  end
end
