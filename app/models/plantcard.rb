class Plantcard < ApplicationRecord
  belongs_to :plant
  has_one :content
  def download
    UserMailer.file_loading(self).deliver_now
  end
end
