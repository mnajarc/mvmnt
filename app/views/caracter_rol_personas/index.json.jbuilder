json.array!(@caracter_rol_personas) do |caracter_rol_persona|
  json.extract! caracter_rol_persona, :id, :caracteristica, :requerido, :rol_persona_id, :tipo_dato_id
  json.url caracter_rol_persona_url(caracter_rol_persona, format: :json)
end
