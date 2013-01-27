class CombustiblesController < ApplicationController
  respond_to :json

  def index
    @combustibles = Combustible.all
  end

  def show
    combustible = Combustible.find_by_slug(params[:id])
    combustible = Combustible.find(params[:id]) if combustible.nil?
    @combustible = combustible
  end

end
