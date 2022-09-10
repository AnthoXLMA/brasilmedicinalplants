class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :send_welcome_email
  # after_create :after_sign_up_path_for!
  # has_many :plants
  # accepts_nested_attributes_for :plants

  private

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  end
end
