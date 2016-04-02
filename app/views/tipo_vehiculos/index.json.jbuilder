json.array!(@tipo_vehiculos) do |tipo_vehiculo|
  json.extract! tipo_vehiculo, :id, :clave_tipo_vehiculo, :tipo_vehiculo
  json.url tipo_dato_url(tipo_vehiculo, format: :json)
end
