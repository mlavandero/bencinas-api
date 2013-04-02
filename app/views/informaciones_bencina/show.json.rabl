object @informacion_bencina
attributes :id, :region, :precio_minimo, :precio_maximo, :precio_promedio, :updated_at

node(:comuna) { |informacion_bencina| informacion_bencina.comuna.nombre }

child :combustible do
  extends "combustibles/show"
end