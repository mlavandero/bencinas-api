class Combustible < ActiveRecord::Base
  attr_accessible :nombre

  has_many :precio

  def to_s
    self.nombre
  end

  def self.find_by_slug slug
    Combustible.all.detect { |c| c.slug == slug }
  end

  def self.find_by_id_or_slug id_or_slug
    combustible = Combustible.find_by_slug(id_or_slug)
    combustible.nil? ? Combustible.find(id_or_slug) : combustible
  end

  def slug
    self.nombre.downcase.strip.gsub(" ", "-")
  end

end
