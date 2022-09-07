class AddNumberColumnToPlants < ActiveRecord::Migration[6.1]
  def change
    add_column :plants, :number, :string
  end
end
