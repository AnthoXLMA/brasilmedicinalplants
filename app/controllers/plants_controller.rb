class PlantsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_plant, only: [:show]

  require 'open-uri'
  require 'nokogiri'
  require 'csv'

  def index
    @plants = Plant.all
  end

  def show
    @plant      = Plant.find(params[:id])
    @all_plants = Plant.all
    @symptoms   = Symptom.all
    @plant_number = @plant.number
    @a = []
    @sympts = @symptoms.each do |sympt|
      @a << sympt
    end
    @index = @sympts.each do |sympt|
      sympt.nom
      sympt.plants.split
    end
    @recipes      = @symptoms.where(plants: "#{@a.split}")
    @number_plant = Symptom.where(plants: @plant_number)
    # @recipses = @symptoms.where(plants: '/#{@plant_number}/')
  end

  private

  def set_plant
    @plant = Plant.find(params[:id])
  end

  def plant_params
    params.require(:plant).permit(:number, :nom_scientifique)
  end
end
