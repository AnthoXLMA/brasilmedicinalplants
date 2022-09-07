class CreateSymptoms < ActiveRecord::Migration[6.1]
  def change
    create_table :symptoms do |t|
      t.string :nom
      t.text :plants

      t.timestamps
    end
  end
end
