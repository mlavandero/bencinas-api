class CambioInformacionesBencinaPorPrecios < ActiveRecord::Migration
  def up
    rename_table :informaciones_bencina, :precios
  end

  def down
    rename_table :precios, :informaciones_bencina
  end
end
