class InformacionBencina < ActiveRecord::Base
  attr_accessible :comuna, :precio_maximo, :precio_minimo, :precio_promedio, :region

  def actualizar_precios
    
  end
end
