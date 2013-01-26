class Combustible < ActiveRecord::Base
  attr_accessible :nombre

  has_many :informacion_bencina

  def slug
    self.nombre.downcase.strip.gsub(" ", "-")
  end

end
