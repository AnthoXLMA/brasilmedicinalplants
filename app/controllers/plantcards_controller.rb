class PlantcardsController < ApplicationController
  # before_action :sign_up, only: [:show]
  # before_action :configure_permitted_parameters, only: [:show]
  before_action :user_is_logged_in

  def show
    @plantcard = Plantcard.find(params[:id])
    send_file(
    "#{Rails.root}/db/plants_index/PDF_CV_linkedin.pdf",
    filename: "plant_info.pdf",
    type: "application/pdf"
  )
    PlantcardMailer.loading_confirmation(@plantcard).deliver_now
  end
end
