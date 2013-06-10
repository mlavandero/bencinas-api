class CambiarRelacionComunaEnInformacionBencina < ActiveRecord::Migration
  def up
    rename_column :informaciones_bencina, :comuna, :comuna_id
    #change_column :informaciones_bencina, :comuna_id, :integer
    execute "alter table informaciones_bencina
        alter column comuna_id type integer using cast(CASE comuna_id WHEN '' THEN NULL ELSE comuna_id END AS integer)"
    execute "UPDATE informaciones_bencina SET comuna_id=1"
  end

  def down
    rename_column :informaciones_bencina, :comuna_id, :comuna
    change_column :informaciones_bencina, :comuna, :string
    execute "UPDATE informaciones_bencina SET comuna='Todas'"
  end
end
