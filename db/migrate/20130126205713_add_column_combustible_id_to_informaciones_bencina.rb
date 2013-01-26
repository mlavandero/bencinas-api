class AddColumnCombustibleIdToInformacionesBencina < ActiveRecord::Migration
  def change
    add_column :informaciones_bencina, :combustible_id, :integer, :after => :comuna

    add_index :informaciones_bencina, :combustible_id
  end
end
