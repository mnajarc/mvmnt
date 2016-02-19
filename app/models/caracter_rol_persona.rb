class CaracterRolPersona < ActiveRecord::Base
  belongs_to :rol_persona
  belongs_to :tipo_dato
end
