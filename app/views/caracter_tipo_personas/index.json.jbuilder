json.array!(@caracter_tipo_personas) do |caracter_tipo_persona|
  json.extract! caracter_tipo_persona, :id, :caracteristica, :requerido, :tipo_dato_id, :tipo_persona_id
  json.url caracter_tipo_persona_url(caracter_tipo_persona, format: :json)
end
