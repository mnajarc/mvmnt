json.array!(@rol_personas) do |rol_persona|
  json.extract! rol_persona, :id, :rol_persona
  json.url rol_persona_url(rol_persona, format: :json)
end