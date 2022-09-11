class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :send_welcome_email
  after_create :send_loading

  private

  def redirect_to_plantcard_show
    redirect_to 'plantcard/id'
  end

  def send_loading
    UserMailer.file_loading(self).deliver_now
  end

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  end
end
