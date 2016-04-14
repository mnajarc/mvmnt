class FormaContacto < ActiveRecord::Base
    validates :clave_forma_contacto, uniqueness: true, presence:true, length: {in: 1..12}
  has_many :caracteristica_forma_contactos, -> { order(:orden) }
  accepts_nested_attributes_for :caracteristica_forma_contactos, allow_destroy: true
end
