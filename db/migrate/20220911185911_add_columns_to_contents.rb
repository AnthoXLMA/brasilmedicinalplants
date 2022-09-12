class AddColumnsToContents < ActiveRecord::Migration[6.1]
  def change
    add_column :contents, :caracteristicas, :text
    add_column :contents, :usos, :text
    add_column :contents, :file_content, :attachment
  end
end
