module ApplicationHelper
  #this method will use always the caracteristica model
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      #render(association.to_s.singularize + "_fields", f: builder)
      render("layouts/caracteristica_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n","")})
  end
  def link_to_add_field(name, f, association)
    #this method will use their own defined model in a partial
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
      #render("layouts/caracteristica_fields", f: builder)
    end
    link_to(name, '#', class: "add_field", data: {id: id, fields: fields.gsub("\n","")})
  end
end
