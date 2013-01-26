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

info = {region: "RM", comuna: "Todas"}

info_combustible_95 = InformacionBencina.first
info_combustible_95.combustible = Combustible.find_by_nombre("Gasolina 95")
info_combustible_95.save

Combustible.all.each do |combustible|
  informacion_bencina = InformacionBencina.find_or_initialize_by_combustible_id(combustible.id)
  informacion_bencina.update_attributes(info)
  informacion_bencina.save
end