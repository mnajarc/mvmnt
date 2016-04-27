class AddColumnPuntoAbToRutaTransporte < ActiveRecord::Migration
  def change
    add_reference :ruta_transportes, :punto_a, class_name: "Localidad"
    add_reference :ruta_transportes, :punto_b, class_name: "Localidad"
  end
end