class CaracterTipoPersona < ActiveRecord::Base
  belongs_to :tipo_dato
  belongs_to :tipo_persona
end
