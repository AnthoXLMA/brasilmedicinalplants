class UserMailer < ApplicationMailer
  default from: 'anthonymania1982@gmail.com'

  def welcome_email(user)
    @user = User.first
    @text = "Hello how are you?"
    @url  = 'http://plantas_brasil.com'
    attachments['PDF_CV_linkedin.pdf'] = File.read('db/plants_index/PDF_CV_linkedin.pdf')
    mail(to: @user.email, subject: "Bonjour #{@user.email}")
  end

  def goodbye
    @user = User.first
    @text = "Goodbye farewell!"
    @url  = 'http://plantas_brasil.com'
    mail(to: @user.email, subject: "Au revoir #{@user.email}")
  end

  def file_loading(user)
    @user = User.first
    attachments['PDF_CV_linkedin.pdf'] = File.read('db/plants_index/PDF_CV_linkedin.pdf')
    mail(:to => @user, :subject => "New account information")
  end
end
