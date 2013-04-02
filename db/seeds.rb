# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

combustibles = [
  {nombre: "Gasolina 93"},
  {nombre: "Gasolina 95"},
  {nombre: "Gasolina 97"},
  {nombre: "Petroleo Diesel"}
]
combustibles.each do |c|
  Combustible.find_or_create_by_nombre(c[:nombre])
end

comunasRM = [
  "Todas",
  "Alhué",
  "Buin",
  "Calera de Tango",
  "Cerrillos",
  "Cerro Navia",
  "Colina",
  "Conchalí",
  "Curacaví",
  "El Bosque",
  "El Monte",
  "Estación Central",
  "Huechuraba",
  "Independencia",
  "Isla de Maipo",
  "La Cisterna",
  "La Florida",
  "La Granja",
  "La Pintana",
  "La Reina",
  "Lampa ",
  "Las Condes",
  "Lo Barnechea",
  "Lo Espejo",
  "Lo Prado",
  "Macul",
  "Maipú",
  "María Pinto",
  "Melipilla",
  "Ñuñoa",
  "Padre Hurtado",
  "Paine",
  "Pedro Aguirre Cerda",
  "Peñaflor",
  "Peñalolén",
  "Pirque",
  "Providencia",
  "Pudahuel",
  "Puente Alto",
  "Quilicura",
  "Quinta Normal",
  "Recoleta",
  "Renca",
  "San Bernardo",
  "San Joaquín",
  "San José de Maipo",
  "San Miguel",
  "San Pedro",
  "San Ramón",
  "Santiago",
  "Talagante",
  "Tiltil",
  "Vitacura"
]

comunasRM.each{ |comuna| Comuna.find_or_create_by_nombre(comuna)}

infos = Comuna.all.map(&:id).product(Combustible.all.map(&:id))

infos.each do |info|
  informacion_bencina = InformacionBencina.find_by_comuna_id_and_combustible_id(info[0], info[1])
  if informacion_bencina.nil?
    InformacionBencina.create({region: "RM", comuna_id: info[0], combustible_id: info[1]})
  end
end