namespace :bencina do
  
  desc "Actualizar los precios de la tabla informaciones_bencina"
  task :actualizar_precios => :environment do
    Precio.all.each do |precio| 
      Rails.logger.info "Actualizando Region #{precio.region}, Comuna: #{precio.comuna}..."
      puts "Actualizando Region #{precio.region}, Comuna: #{precio.comuna}..."
      precio.actualizar_precios
      Rails.logger.info "- Actualizacion: #{precio.to_json}"
    end
  end

end