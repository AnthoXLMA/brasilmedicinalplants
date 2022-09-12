class Plantcard < ApplicationRecord
  belongs_to :plant
  has_one :content

  # def download
  #   UserMailer.file_loading(self).deliver_now
  # end

  def download_pdf(plantcard: "")
    @plantcard = Plantcard.find(params[:id])
    send_file("#{Rails.root}/db/fixtures/plant_contents/plant_#{@plantcard}.pdf",
      filename: "plant_#{@plantcard}.pdf",
      type: "application/pdf"
    )
  end

  # private

  # def set_plantcard
  #   @plantcard = Plantcard.find(params[:id])
  # end

  # def plantcard_params
  #   params.require(:plantcard).permit(:plant_id, :title)
  # end
end
