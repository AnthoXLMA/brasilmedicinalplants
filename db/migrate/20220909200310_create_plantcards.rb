class CreatePlantcards < ActiveRecord::Migration[6.1]
  def change
    create_table :plantcards do |t|
      t.string :title
      t.references :plant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
