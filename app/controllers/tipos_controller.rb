class TiposController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @especies = Tipo.all
  end

  def show
    @especie = Tipo.find(params[:id])
  end
end
