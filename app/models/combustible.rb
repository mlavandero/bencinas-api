class Combustible < ActiveRecord::Base
  attr_accessible :nombre

  has_many :informacion_bencina

  def self.find_by_slug slug
    Combustible.all.detect { |c| c.slug == slug }
  end

  def slug
    self.nombre.downcase.strip.gsub(" ", "-")
  end

end
