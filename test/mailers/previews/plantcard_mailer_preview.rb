# Preview all emails at http://localhost:3000/rails/mailers/plantcard_mailer
class PlantcardMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/plantcard_mailer/loading_confirmation
  def loading_confirmation
    PlantcardMailer.loading_confirmation
  end

end
