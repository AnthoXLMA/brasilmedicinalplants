class TratamentosController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_tratamento, only: [ :show]

  def index
    @tratamentos = Tratamento.all
  end

  def show
    @tratamento = Tratamento.find(params[:id])
  end

  private

  def set_tratamento
    @tratamento = Tratamento.find(params[:id])
  end

  def tratamento_params
    params.require(:tratamento).permit(:nom, :description)
  end
end
