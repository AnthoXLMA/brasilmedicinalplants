class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :send_welcome_email
  after_create :download
  # has_many :plants
  # accepts_nested_attributes_for :plants

  private

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_now
  end

  def download
    UserMailer.file_loading(self).deliver_now
  end
end
