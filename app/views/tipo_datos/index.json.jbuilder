json.array!(@tipo_datos) do |tipo_dato|
  json.extract! tipo_dato, :id, :tipo_dato, :dataprot
  json.url tipo_dato_url(tipo_dato, format: :json)
end
