json.array!(@nacions) do |nacion|
  json.extract! nacion, :id, :nombre
  json.url nacion_url(nacion, format: :json)
end
