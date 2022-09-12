class AddPlantcardRefToContents < ActiveRecord::Migration[6.1]
  def change
    add_reference :contents, :plantcard, null: false, foreign_key: true
  end
end
