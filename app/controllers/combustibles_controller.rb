class CombustiblesController < ApplicationController
  respond_to :json

  def index
    @combustibles = Combustible.all
  end

  def show
    @combustible = Combustible.find_by_id_or_slug params[:id]
  end

end
