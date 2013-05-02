namespace :bencina do
  
  desc "Actualizar los precios de la tabla informaciones_bencina"
  task :actualizar_precios => :environment do
    InformacionBencina.all.each do |ib| 
      Rails.logger.info "Actualizando Region #{ib.region}, Comuna: #{ib.comuna}..."
      puts "Actualizando Region #{ib.region}, Comuna: #{ib.comuna}..."
      ib.actualizar_precios
      Rails.logger.info "- Actualizacion: #{ib.to_json}"
    end
  end

end