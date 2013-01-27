class InformacionesBencinaController < ApplicationController
  respond_to :json
  
  def index
    @informaciones_bencina = InformacionBencina.all and return unless params[:combustible_id]
    combustible = Combustible.find_by_id_or_slug params[:combustible_id]
    @informaciones_bencina = combustible.informacion_bencina
  end

  def show
    @informacion_bencina = InformacionBencina.find(params[:id]) and return unless params[:combustible_id]
    combustible = Combustible.find_by_id_or_slug params[:combustible_id]
    @informacion_bencina = combustible.informacion_bencina.find(params[:id])
  end

end
