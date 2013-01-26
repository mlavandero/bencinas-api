class InformacionBencina < ActiveRecord::Base
  attr_accessible :comuna, :precio_maximo, :precio_minimo, :precio_promedio, :region

  include Capybara::DSL

  def actualizar_precios
    visit('')
    select 'Gasolina 95', :from => 'reporte_combustible'
    click_button "Ver reporte"
    self.precio_minimo = find('table#tabla_resumen td:nth-child(1) b').text[/[0-9\.]+/]
    self.precio_maximo = find('table#tabla_resumen td:nth-child(2) b').text[/[0-9\.]+/]
    self.precio_promedio = find('table#tabla_resumen td:nth-child(3) b').text[/[0-9\.]+/]
    self.updated_at = Time.now
    self.save
  end
end
