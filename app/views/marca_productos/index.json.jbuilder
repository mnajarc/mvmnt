json.array!(@forma_contactos) do |forma_contacto|
  json.extract! forma_contacto, :id, :clave_forma_contacto, :forma_contacto
  json.url forma_contacto_url(forma_contacto, format: :json)
end
