json.array!(@estados) do |estado|
  json.extract! estado, :id, :nombre_estado, :nacion_id
  json.url estado_url(estado, format: :json)
end
