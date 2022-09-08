class AddPopularNameColumnToPlants < ActiveRecord::Migration[6.1]
  def change
    add_column :plants, :noms_populaires, :text
  end
end
