class InformacionesBencinaController < ApplicationController
  respond_to :json
  
  def index
    render :text => InformacionBencina.all.to_json and return unless params[:combustible_id]
    combustible = Combustible.find_by_slug(params[:combustible_id])
    combustible = Combustible.find(params[:combustible_id]) if combustible.nil?
    render :text => combustible.informacion_bencina.to_json
  end

  def show
    render :text => InformacionBencina.find(params[:id]).to_json and return unless params[:combustible_id]
    combustible = Combustible.find_by_slug(params[:combustible_id])
    combustible = Combustible.find(params[:combustible_id]) if combustible.nil?
    render :text => combustible.informacion_bencina.find(params[:id]).to_json
  end

end
