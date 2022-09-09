class SymptomsController < ApplicationController
  before_action :set_symptom, only: [:show]
  require 'open-uri'
  require 'nokogiri'
  require "csv"

  def index
    @symptoms = Symptom.all
  end

  def show
    @plant_index = Plant.all
    @symptom  = Symptom.find(params[:id])
    @healings = @symptom.plants.split
    @plantes  = @healings
    @number_plant = Plant.where(number: @plantes)
  end

  private

  def set_symptom
    @symptom = Symptom.find(params[:id])
  end

  def symptom_params
    params.require(:symptom).permit(:name, :plants)
  end
end
