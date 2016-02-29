json.array!(@paginas) do |pagina|
  json.extract! pagina, :id, :nombre, :contenido, :ancestry
  json.url pagina_url(pagina, format: :json)
end
