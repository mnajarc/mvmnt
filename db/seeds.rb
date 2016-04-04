# TipoDato.create!([
#   {tipo_dato: "Cadena", dataprot: "string_field"},
#   {tipo_dato: "Booleano", dataprot: "check_box"},
#   {tipo_dato: "Texto", dataprot: "text_field"},
#   {tipo_dato: "Momento", dataprot: "datetime_field"},
#   {tipo_dato: "Fecha", dataprot: "date_field"},
#   {tipo_dato: "Entero", dataprot: "number_field"},
#   {tipo_dato: "Telefono", dataprot: "telephone_field"},
#   {tipo_dato: "Correo", dataprot: "email_field"},
#   {tipo_dato: "Número", dataprot: "decimal_field"}
# ])
# TipoPersona.create!([
#   {tipo_persona: "Física"},
#   {tipo_persona: "Moral"}
# ])
# CaracterTipoPersona.create!([
#   {caracteristica: "Teléfono", requerido: false, tipo_dato_id: 7, tipo_persona_id: 1},
#   {caracteristica: "Contacto Emergencia", requerido: false, tipo_dato_id: 7, tipo_persona_id: 1},
#   {caracteristica: "Teléfono emergencia", requerido: false, tipo_dato_id: 7, tipo_persona_id: 1},
#   {caracteristica: "Correo electrónico", requerido: false, tipo_dato_id: 8, tipo_persona_id: 1},
#   {caracteristica: "Domicilio", requerido: true, tipo_dato_id: 5, tipo_persona_id: 1},
#   {caracteristica: "Tipo de sangre", requerido: true, tipo_dato_id: 1, tipo_persona_id: 1},
#   {caracteristica: "Número licencia", requerido: true, tipo_dato_id: 1, tipo_persona_id: 1},
#   {caracteristica: "Tipo Licencia", requerido: true, tipo_dato_id: 1, tipo_persona_id: 1},
#   {caracteristica: "Vigencia Licencia", requerido: true, tipo_dato_id: 2, tipo_persona_id: 1},
#   {caracteristica: "Clave IMSS", requerido: true, tipo_dato_id: 1, tipo_persona_id: 1},
#   {caracteristica: "Domicilio Fiscal", requerido: true, tipo_dato_id: 5, tipo_persona_id: 2},
#   {caracteristica: "RFC", requerido: true, tipo_dato_id: 1, tipo_persona_id: 2},
#   {caracteristica: "Ramo/Giro", requerido: false, tipo_dato_id: 1, tipo_persona_id: 2},
#   {caracteristica: "Nombre Contacto", requerido: true, tipo_dato_id: 1, tipo_persona_id: 2},
#   {caracteristica: "Teléfono", requerido: false, tipo_dato_id: 7, tipo_persona_id: 2},
#   {caracteristica: "Correo electronico", requerido: false, tipo_dato_id: 8, tipo_persona_id: 2},
#   {caracteristica: "Condiciones comerciales", requerido: false, tipo_dato_id: 5, tipo_persona_id: 2},
#   {caracteristica: "Comentarios", requerido: false, tipo_dato_id: 5, tipo_persona_id: 2}
# ])
# RolPersona.create!([
#   {rol_persona: "Operador", tipo_persona_id: 1},
#   {rol_persona: "Empleado", tipo_persona_id: 1},
#   {rol_persona: "Proveedor", tipo_persona_id: 2},
#   {rol_persona: "Cliente", tipo_persona_id: 2},
# ])
# CaracterRolPersona.create!([
#   {caracteristica: "Fecha Alta", requerido: true, rol_persona_id: 1, tipo_dato_id: 2},
#   {caracteristica: "Fecha Baja", requerido: false, rol_persona_id: 1, tipo_dato_id: 2},
#   {caracteristica: "Salario Base", requerido: true, rol_persona_id: 1, tipo_dato_id: 3},
#   {caracteristica: "Comentarios", requerido: false, rol_persona_id: 1, tipo_dato_id: 5},
#   {caracteristica: "Fecha Contratacion", requerido: true, rol_persona_id: 2, tipo_dato_id: 2},
#   {caracteristica: "Fecha Baja", requerido: false, rol_persona_id: 2, tipo_dato_id: 2},
#   {caracteristica: "Salario Integrado", requerido: false, rol_persona_id: 2, tipo_dato_id: 3},
#   {caracteristica: "Comentarios", requerido: false, rol_persona_id: 2, tipo_dato_id: 5},
#   {caracteristica: "Pagina web", requerido: false, rol_persona_id: 3, tipo_dato_id: 1},
#   {caracteristica: "Sucursales", requerido: false, rol_persona_id: 3, tipo_dato_id: 5},
#   {caracteristica: "dia de pago", requerido: true, rol_persona_id: 3, tipo_dato_id: 2},
#   {caracteristica: "Planta Direccion", requerido: false, rol_persona_id: 4, tipo_dato_id: 5},
#   {caracteristica: "Planta Contacto", requerido: false, rol_persona_id: 4, tipo_dato_id: nil},
#   {caracteristica: "Planta Telefono", requerido: false, rol_persona_id: 4, tipo_dato_id: nil},
#   {caracteristica: "Planta Correo Electronico", requerido: false, rol_persona_id: 4, tipo_dato_id: nil}
# ])
# Nacion.create!([
#   {nombre: "Mexico"}
# ])
# Estado.create!([
#   {nombre_estado: "Aguascalientes", nacion_id: 1},
# ])
# Localidad.create!([
#   {nombre_localidad: "Aguascalientes", estado_id: 1},
#   {nombre_localidad: "jesus maria", estado_id: 1},
#   {nombre_localidad: "Rincon de Romos", estado_id: 1}
# ])
# Pagina.create!([
#   {nombre: "Administración", contenido: "Se administran diferentes clases de activos como personas, vehículos, inventarios, etc", ancestry: nil, ruta: "/"},
#   {nombre: "Configuración Sistema", contenido: "", ancestry: "1", ruta: "/"},
#   {nombre: "Tipo Datos", contenido: "", ancestry: "1/21", ruta: "/tipo_datos"},
#   {nombre: "Geografía", contenido: "", ancestry: "1/21", ruta: "/nacions"},
#   {nombre: "Configura Personas", contenido: "", ancestry: "1", ruta: "/"},
#   {nombre: "Tipo Persona", contenido: "", ancestry: "1/20", ruta: "/tipo_personas"},
#   {nombre: "Rol Personas", contenido: "", ancestry: "1/20", ruta: "/rol_personas"},
#   {nombre: "Configura Vehiculos", contenido: "", ancestry: "1", ruta: "/"},
#   {nombre: "Tipos de Vehículo", contenido: "", ancestry: "1/28", ruta: "/tipo_vehiculos"},
#   {nombre: "Operación", contenido: "", ancestry: nil, ruta: "/"},
#   {nombre: "Personas", contenido: "", ancestry: "25", ruta: "/personas"}
# ])
