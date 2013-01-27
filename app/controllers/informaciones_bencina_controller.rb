class InformacionesBencinaController < ApplicationController
  
  def index
    @informaciones_bencina = InformacionBencina.all and return unless params[:combustible_id]
    combustible = Combustible.find_by_slug(params[:combustible_id])
    combustible = Combustible.find(params[:combustible_id]) if combustible.nil?
    @informaciones_bencina = combustible.informacion_bencina
  end

  def show
    @informacion_bencina = InformacionBencina.find(params[:id]) and return unless params[:combustible_id]
    combustible = Combustible.find_by_slug(params[:combustible_id])
    combustible = Combustible.find(params[:combustible_id]) if combustible.nil?
    @informacion_bencina = combustible.informacion_bencina.find(params[:id])
  end

end
