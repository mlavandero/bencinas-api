class CreateInformacionesBencina < ActiveRecord::Migration
  def change
    create_table :informaciones_bencina do |t|
      t.string :region
      t.string :comuna
      t.decimal :precio_minimo, precision: 10, scale: 2
      t.decimal :precio_maximo, precision: 10, scale: 2
      t.decimal :precio_promedio, precision: 10, scale: 2

      t.timestamps
    end
  end
end
