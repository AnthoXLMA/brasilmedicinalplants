class PlantsController < ApplicationController
  before_action :authenticate_user!, only: [:download_pdf]
  # before_action :set_plant, only: [:show]
  # before_action :set_user, only: [:download_pdf]
  require 'open-uri'
  require 'nokogiri'
  require 'csv'

  def index
    @plants = Plant.all
    @symptoms = Symptom.all
    @tipos = Tipo.all
  end

  def show
    @user = current_user
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

  def download_pdf
  send_file("#{Rails.root}/db/plants_index/PDF_CV_linkedin.pdf",
    filename: "PDF_CV_linkedin.pdf",
    type: "application/pdf"
  )
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

  # def set_user
  #   @user = User.find(params[:id])
  # end

  # # Only allow a list of trusted parameters through.
  # def user_params
  #   params.require(:user).permit(:name, :email, :login)
  # end
end
