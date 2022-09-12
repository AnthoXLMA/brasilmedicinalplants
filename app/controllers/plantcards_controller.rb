class PlantcardsController < ApplicationController
  # REACTIVER ABSOLUMENT POUR RESTRICTIONS USER ON PLANT SHOW
  # before_action :authenticate_user
  def show
    @tipos  = Tipo.all
    @plants = Plant.all
    @plant      = Plant.find(params[:id])
    @plantcard  = Plantcard.find(params[:id]).id.to_i
    @seed   = @plant.tipo_id
    @result = @tipos.where(id: @seed)
    @contents = Content.all
    @content = @contents.where(id: @plantcard)
    # @content_file = @content[0].file_content.attach(io: File.open("./db/fixtures/plant_contents/plant_#{@plantcard}.pdf"), filename: "plant_#{@plantcard}.pdf")
  end

  def download_pdf(plantcard:"")
    @plantcard = Plantcard.find(params[:id]).id.to_i
      send_file("#{Rails.root}/db/fixtures/plant_contents/plant_#{@plantcard}.pdf",
      filename: "plant_#{@plantcard}.pdf"
    )
  end

  private

  def set_plantcard
    @plantcard = Plantcard.find(params[:id])
  end

  def plantcard_params
    params.require(:plantcard).permit(:plant_id, :title)
  end
end
