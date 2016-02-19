json.array!(@personas) do |persona|
  json.extract! persona, :id, :nombre_persona, :identificador, :tipo_persona_id
  json.url persona_url(persona, format: :json)
end
