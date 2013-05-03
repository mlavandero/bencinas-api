class PreciosController < ApplicationController
  respond_to :json, :html
  
  def index
    @precios = Precio.all and return unless params[:combustible_id]
    combustible = Combustible.find_by_id_or_slug params[:combustible_id]
    @precios = combustible.precio
  end

  def show
    @precio = Precio.find(params[:id]) and return unless params[:combustible_id]
    combustible = Combustible.find_by_id_or_slug params[:combustible_id]
    @precio = combustible.precio.find(params[:id])
  end

end
