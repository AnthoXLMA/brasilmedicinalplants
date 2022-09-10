class Plantcard < ApplicationRecord
  belongs_to :plant

  def download
    UserMailer.file_loading(self).deliver_now
  end
end
