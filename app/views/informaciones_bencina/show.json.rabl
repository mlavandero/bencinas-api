object @informacion_bencina
attributes :id, :region, :comuna, :precio_minimo, :precio_maximo, :precio_promedio, :updated_at

child :combustible do
  extends "combustibles/show"
end