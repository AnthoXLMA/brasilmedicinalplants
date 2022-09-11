class Plant < ApplicationRecord
  has_many :plantcards
  belongs_to :tipo
end
