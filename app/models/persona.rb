class Persona < ActiveRecord::Base
  belongs_to :tipo_persona
  belongs_to :rol_persona
  has_many :caracter_tipo_personas, -> { order(orden)}
  has_many :caracter_rol_persona, -> { order(orden)}
  validates :nombre_persona, presence: true
  validates :tipo_persona_id, presence: true
  validates :rol_persona_id, presence: true
  # cuando se usa un hstore se usa storeaccessor
  store_accessor :tipo_caracteres
  store_accessor :rol_caracteres
  # cuando se usa un texto se usa un serialize
  #serialize :tipo_caracteres, Hash
  #serialize :rol_caracteres, Hash
  
  validate :valida_caracteres
            
  def valida_caracteres
    tipo_persona.caracter_tipo_personas.each do |campo|
      if campo.requerido? && tipo_caracteres[campo.caracteristica].blank?
        errors.add campo.caracteristica, ' no puede estar en blanco'
      end
    end
    rol_persona.caracter_rol_personas.each do |campo|
      if campo.requerido? && rol_caracteres[campo.caracteristica].blank?
        errors.add campo.caracteristica, ' no puede estar en blanco'
      end
    end

  end
  def self.search(search)
    if search
      self.where('nombre_persona ilike ?', "%#{search}%")
    else
      self.all
    end
  end
end
