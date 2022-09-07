class CreatePlants < ActiveRecord::Migration[6.1]
  def change
    create_table :plants do |t|
      t.string :nom_scientifique

      t.timestamps
    end
  end
end
