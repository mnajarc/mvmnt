class RolPersona < ActiveRecord::Base
  belongs_to :tipo_persona
  has_many :caracter_rol_personas
  validates :tipo_persona_id, presence: true
  accepts_nested_attributes_for :caracter_rol_personas, allow_destroy: true
end
