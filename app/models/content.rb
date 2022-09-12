class Content < ApplicationRecord
  belongs_to :plantcard

  has_one_attached :file_content
end
