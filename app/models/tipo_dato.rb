class TipoDato < ActiveRecord::Base
  
  has_many :caracteristica_forma_contactos
  has_many :caracteristica_tipo_almacens
  has_many :caracteristica_tipo_productos
  has_many :caracteristica_tipo_vehiculos
  has_many :caracter_rol_personas
  has_many :caracter_tipo_personas
end
