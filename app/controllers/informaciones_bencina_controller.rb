class InformacionesBencinaController < ApplicationController
  respond_to :json
  
  def index
    render :text => InformacionBencina.all.to_json
  end

  def show
    info = InformacionBencina.find(params[:id])
    render :text => info.to_json
  end

end
