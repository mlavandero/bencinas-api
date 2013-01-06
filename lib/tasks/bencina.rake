namespace :bencina do
  
  desc "Actualizar los precios de la tabla informaciones_bencina"
  task :actualizar_precios => :environment do
    InformacionBencina.all.each do |ib| 
      puts "Actualizando Region #{ib.region}, Comuna: #{ib.comuna}..."
      ib.actualizar_precios
    end
  end

end