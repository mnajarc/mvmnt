json.array!(@tipo_personas) do |tipo_persona|
  json.extract! tipo_persona, :id, :tipo_persona
  json.url tipo_persona_url(tipo_persona, format: :json)
end
