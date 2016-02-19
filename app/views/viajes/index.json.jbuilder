json.array!(@viajes) do |viaje|
  json.extract! viaje, :id, :origen, :destino, :distancia, :combustible, :Peaje, :gasto_extra
  json.url viaje_url(viaje, format: :json)
end
