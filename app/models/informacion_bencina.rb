class InformacionBencina < ActiveRecord::Base
  attr_accessible :comuna, :precio_maximo, :precio_minimo, :precio_promedio, :region, :comuna_id, :combustible_id

  belongs_to :combustible
  belongs_to :comuna

  def actualizar_precios
    codigos_comunas = {
      "Todas" => "",
      "Alhué" => "338",
      "Buin" => "334",
      "Calera de Tango" => "335",
      "Cerrillos" => "296",
      "Cerro Navia" => "297",
      "Colina" => "330",
      "Conchalí" => "298",
      "Curacaví" => "339",
      "El Bosque" => "299",
      "El Monte" => "343",
      "Estación Central" => "300",
      "Huechuraba" => "301",
      "Independencia" => "302",
      "Isla de Maipo" => "344",
      "La Cisterna" => "303",
      "La Florida" => "304",
      "La Granja" => "305",
      "La Pintana" => "306",
      "La Reina" => "307",
      "Lampa " => "331",
      "Las Condes" => "308",
      "Lo Barnechea" => "309",
      "Lo Espejo" => "310",
      "Lo Prado" => "311",
      "Macul" => "312",
      "Maipú" => "313",
      "María Pinto" => "340",
      "Melipilla" => "337",
      "Ñuñoa" => "314",
      "Padre Hurtado" => "345",
      "Paine" => "336",
      "Pedro Aguirre Cerda" => "315",
      "Peñaflor" => "346",
      "Peñalolén" => "316",
      "Pirque" => "328",
      "Providencia" => "317",
      "Pudahuel" => "318",
      "Puente Alto" => "327",
      "Quilicura" => "319",
      "Quinta Normal" => "320",
      "Recoleta" => "321",
      "Renca" => "322",
      "San Bernardo" => "333",
      "San Joaquín" => "323",
      "San José de Maipo" => "329",
      "San Miguel" => "324",
      "San Pedro" => "341",
      "San Ramón" => "325",
      "Santiago" => "295",
      "Talagante" => "342",
      "Tiltil" => "332",
      "Vitacura" => "326"
    }

    agent = Mechanize.new
    buscador = agent.get('http://www.bencinaenlinea.cl/web2/buscador.php?region=7').body
    token = buscador.match(/imprimir_tabla_resumen\('(\S*)'\);/)[1]
    buscador_comuna_id = codigos_comunas[self.comuna.nombre]
    buscador_combustible_id = buscador.match(/<option value='(\d*)'>#{self.combustible.nombre}<\/option>/)[1]
    params_hash = {
      "region" => "7",
      "comuna" => buscador_comuna_id,
      "combustible" => buscador_combustible_id,
      "token" => token
    }
    tabla_resumen = agent.post('http://www.bencinaenlinea.cl/web2/imprimir_tabla_resumen.php', params_hash).body
    resultado = tabla_resumen.scan(/\$(\d*)/)

    puts "resultado: #{resultado}"

    self.precio_minimo = resultado[0][0].to_i
    self.precio_maximo = resultado[1][0].to_i
    self.precio_promedio = resultado[2][0].to_i
    self.save
  end
end
