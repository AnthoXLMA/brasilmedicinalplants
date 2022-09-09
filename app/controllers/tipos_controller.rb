class TiposController < ApplicationController

  def index
    @especies = Tipo.all
  end

  def show
    @especie = Tipo.find(params[:id])
  end
end
