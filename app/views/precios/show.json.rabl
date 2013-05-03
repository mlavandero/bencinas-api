object @precio
attributes :id, :region, :precio_minimo, :precio_maximo, :precio_promedio, :updated_at

node(:comuna) { |precio| precio.comuna.nombre }

child :combustible do
  extends "combustibles/show"
end