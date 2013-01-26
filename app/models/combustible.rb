class Combustible < ActiveRecord::Base
  attr_accessible :nombre

  has_many :informacion_bencina
end
