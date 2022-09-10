class PlantcardsController < ApplicationController
# before_action :user_is_logged_in

  def show
    @tipos = Tipo.all
    @plants = Plant.all
    @plant      = Plant.find(params[:id])
    @plantcard  = Plantcard.find(params[:id])
    @seed     = @plant.tipo_id
    @result = @tipos.where(id: @seed)
  #   send_file(
  #   "#{Rails.root}/db/plants_index/PDF_CV_linkedin.pdf",
  #   filename: "plant_info.pdf",
  #   type: "application/pdf"
  # )
    # PlantcardMailer.loading_confirmation(@plantcard).deliver_now
  end

  private

  def set_plantcard
    @plantcard = Plantcard.find(params[:id])
  end

  def plantcard_params
    params.require(:plantcard).permit(:plant_id)
  end
end
