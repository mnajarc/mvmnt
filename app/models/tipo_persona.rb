class TipoPersona < ActiveRecord::Base
  has_many :caracter_tipo_personas
  has_many :rol_personas
  accepts_nested_attributes_for :caracter_tipo_personas, allow_destroy: true
end
