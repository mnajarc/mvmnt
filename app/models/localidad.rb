class Localidad < ActiveRecord::Base
  belongs_to :estado
  has_many :punto_as, class_name: 'RutaTransporte', foreign_key: 'punto_a_id'
  has_many :punto_bs, class_name: 'RutaTransporte', foreign_key: 'punto_b_id'
end
