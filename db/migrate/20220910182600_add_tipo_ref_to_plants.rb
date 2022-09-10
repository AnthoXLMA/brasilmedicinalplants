class AddTipoRefToPlants < ActiveRecord::Migration[6.1]
  def change
    add_reference :plants, :tipo, null: false, foreign_key: true
  end
end
