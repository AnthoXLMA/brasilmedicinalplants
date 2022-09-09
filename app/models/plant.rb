class Plant < ApplicationRecord
  has_many :plantcards

  # has_many :users
  # accepts_nested_attributes_for :users

  # after_create :download_pdf

  # private

  # def download_pdf
  #   UserMailer.with(file: self).welcome_email.deliver_now
  # end
end
