# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

info = [
  {region: "RM", comuna: "Todas"}
]
info.each do |i|
  InformacionBencina.find_or_create_by_region_and_comuna(i[:region], i[:comuna])
end