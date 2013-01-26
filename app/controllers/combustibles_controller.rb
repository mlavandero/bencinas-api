class CombustiblesController < ApplicationController
  respond_to :json

  def index
    render :text => Combustible.all.to_json
  end

  def show
    combustible = Combustible.find_by_slug(params[:id])
    combustible = Combustible.find(params[:id]) if combustible.nil?
    render :text => combustible.to_json
  end

end
