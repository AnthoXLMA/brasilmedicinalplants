class PlantsController < ApplicationController
  skip_before_action :authenticate_user!
  # before_action :set_plant, only: [:show]

  require 'open-uri'
  require 'nokogiri'
  require 'csv'

  def index
    @plants = Plant.all
    @symptoms = Symptom.all
    @tipos = Tipo.all
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
  end


    IMAGES_PATH = File.join(Rails.root, "public")
  def download
    send_file(File.join(IMAGES_PATH, "laplantedusiecle.rb"))
  end

  def download(file)
    send_file(Rails.root.join('app' , 'assets', 'images', 'laplantedusiecle.rb'))
  end

  def plant_infos
    @plant = Plant.find(params[:id])
    @plant_info_doc = "./plants/plant_infos.html.erb"
    @serialized_doc = File.read(@plant_info_doc)
    @document = Document.find(params[:id])
    send_data @document.file.read, filename: @document.name
  end

  private

  def set_plant
    @plant = Plant.find(params[:id])
  end

  def plant_params
    params.require(:plant).permit(:number, :nom_scientifique)
  end
end
