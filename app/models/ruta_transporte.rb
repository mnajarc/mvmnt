class RutaTransporte < ActiveRecord::Base
  belongs_to :punto_a, class_name: "Localidad", foreign_key:  "punto_a_id"
  belongs_to :punto_b, class_name: "Localidad", foreign_key:  "punto_b_id"
end