class CreateTratamentos < ActiveRecord::Migration[6.1]
  def change
    create_table :tratamentos do |t|
      t.string :nom
      t.text :description

      t.timestamps
    end
  end
end
