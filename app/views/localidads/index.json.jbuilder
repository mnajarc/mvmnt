json.array!(@localidads) do |localidad|
  json.extract! localidad, :id, :nombre_localidad, :estado_id
  json.url localidad_url(localidad, format: :json)
end
