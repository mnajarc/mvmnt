# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160423022109) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "caracter_rol_personas", force: :cascade do |t|
    t.string   "caracteristica", limit: 48
    t.boolean  "requerido"
    t.integer  "rol_persona_id"
    t.integer  "tipo_dato_id"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.decimal  "orden",                     precision: 5, scale: 2
  end

  add_index "caracter_rol_personas", ["rol_persona_id", "orden"], name: "index_caracter_rol_personas_on_rol_persona_id_and_orden", unique: true, using: :btree
  add_index "caracter_rol_personas", ["rol_persona_id"], name: "index_caracter_rol_personas_on_rol_persona_id", using: :btree
  add_index "caracter_rol_personas", ["tipo_dato_id"], name: "index_caracter_rol_personas_on_tipo_dato_id", using: :btree

  create_table "caracter_tipo_personas", force: :cascade do |t|
    t.string   "caracteristica",  limit: 48
    t.boolean  "requerido"
    t.integer  "tipo_dato_id"
    t.integer  "tipo_persona_id"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.decimal  "orden",                      precision: 5, scale: 2
  end

  add_index "caracter_tipo_personas", ["tipo_dato_id"], name: "index_caracter_tipo_personas_on_tipo_dato_id", using: :btree
  add_index "caracter_tipo_personas", ["tipo_persona_id", "orden"], name: "index_caracter_tipo_personas_on_tipo_persona_id_and_orden", unique: true, using: :btree
  add_index "caracter_tipo_personas", ["tipo_persona_id"], name: "index_caracter_tipo_personas_on_tipo_persona_id", using: :btree

  create_table "caracteristica_forma_contactos", force: :cascade do |t|
    t.string   "caracteristica",    limit: 48
    t.boolean  "requerido"
    t.integer  "tipo_dato_id"
    t.integer  "forma_contacto_id"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.decimal  "orden",                        precision: 5, scale: 2
  end

  add_index "caracteristica_forma_contactos", ["forma_contacto_id", "orden"], name: "formacontacto_orden_idx", unique: true, using: :btree
  add_index "caracteristica_forma_contactos", ["forma_contacto_id"], name: "index_caracteristica_forma_contactos_on_forma_contacto_id", using: :btree
  add_index "caracteristica_forma_contactos", ["tipo_dato_id"], name: "index_caracteristica_forma_contactos_on_tipo_dato_id", using: :btree

  create_table "caracteristica_tipo_vehiculos", force: :cascade do |t|
    t.string   "caracteristica",   limit: 48
    t.boolean  "requerido"
    t.integer  "tipo_dato_id"
    t.integer  "tipo_vehiculo_id"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.decimal  "orden",                       precision: 5, scale: 2
  end

  add_index "caracteristica_tipo_vehiculos", ["tipo_dato_id"], name: "index_caracteristica_tipo_vehiculos_on_tipo_dato_id", using: :btree
  add_index "caracteristica_tipo_vehiculos", ["tipo_vehiculo_id", "orden"], name: "tipovehiculo_orden_idx", unique: true, using: :btree
  add_index "caracteristica_tipo_vehiculos", ["tipo_vehiculo_id"], name: "index_caracteristica_tipo_vehiculos_on_tipo_vehiculo_id", using: :btree

  create_table "estado_operativos", force: :cascade do |t|
    t.string   "clave_status", limit: 2
    t.string   "status"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "estado_operativos", ["clave_status"], name: "index_estado_operativos_on_clave_status", unique: true, using: :btree

  create_table "estados", force: :cascade do |t|
    t.string   "nombre_estado"
    t.integer  "nacion_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "clave_estado",  limit: 3
  end

  add_index "estados", ["nacion_id", "clave_estado"], name: "index_estados_on_nacion_id_and_clave_estado", unique: true, using: :btree
  add_index "estados", ["nacion_id"], name: "index_estados_on_nacion_id", using: :btree

  create_table "forma_contactos", force: :cascade do |t|
    t.string   "clave_forma_contacto", limit: 12
    t.string   "forma_contacto",       limit: 48
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "forma_contactos", ["clave_forma_contacto"], name: "index_forma_contactos_on_clave_forma_contacto", unique: true, using: :btree
  add_index "forma_contactos", ["forma_contacto"], name: "index_forma_contactos_on_forma_contacto", unique: true, using: :btree

  create_table "localidads", force: :cascade do |t|
    t.string   "nombre_localidad"
    t.integer  "estado_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "clave_localidad",  limit: 3
  end

  add_index "localidads", ["estado_id", "clave_localidad"], name: "index_localidads_on_estado_id_and_clave_localidad", unique: true, using: :btree
  add_index "localidads", ["estado_id"], name: "index_localidads_on_estado_id", using: :btree

  create_table "marca_vehiculos", force: :cascade do |t|
    t.string   "clave_marca_vehiculo", limit: 20
    t.string   "marca_vehiculo"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "marca_vehiculos", ["clave_marca_vehiculo"], name: "index_marca_vehiculos_on_clave_marca_vehiculo", unique: true, using: :btree

  create_table "modelo_vehiculos", force: :cascade do |t|
    t.string   "clave_modelo_vehiculo", limit: 20
    t.string   "modelo_vehiculo"
    t.integer  "marca_vehiculo_id"
    t.integer  "tipo_vehiculo_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "modelo_vehiculos", ["clave_modelo_vehiculo"], name: "index_modelo_vehiculos_on_clave_modelo_vehiculo", unique: true, using: :btree
  add_index "modelo_vehiculos", ["marca_vehiculo_id"], name: "index_modelo_vehiculos_on_marca_vehiculo_id", using: :btree
  add_index "modelo_vehiculos", ["tipo_vehiculo_id"], name: "index_modelo_vehiculos_on_tipo_vehiculo_id", using: :btree

  create_table "nacions", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "clave_pais", limit: 3
  end

  add_index "nacions", ["clave_pais"], name: "index_nacions_on_clave_pais", unique: true, using: :btree

  create_table "paginas", force: :cascade do |t|
    t.string   "nombre"
    t.string   "contenido"
    t.string   "ancestry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "ruta"
  end

  add_index "paginas", ["ancestry"], name: "index_paginas_on_ancestry", using: :btree

  create_table "personas", force: :cascade do |t|
    t.string   "nombre_persona"
    t.string   "identificador",   limit: 32
    t.integer  "tipo_persona_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "rol_persona_id"
    t.hstore   "rol_caracteres"
    t.hstore   "tipo_caracteres"
  end

  add_index "personas", ["identificador"], name: "index_personas_on_identificador", unique: true, using: :btree
  add_index "personas", ["rol_caracteres"], name: "index_personas_on_rol_caracteres", using: :gin
  add_index "personas", ["rol_persona_id"], name: "index_personas_on_rol_persona_id", using: :btree
  add_index "personas", ["tipo_caracteres"], name: "index_personas_on_tipo_caracteres", using: :gin
  add_index "personas", ["tipo_persona_id"], name: "index_personas_on_tipo_persona_id", using: :btree

  create_table "rol_personas", force: :cascade do |t|
    t.string   "rol_persona",     limit: 32
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "tipo_persona_id"
  end

  add_index "rol_personas", ["rol_persona"], name: "index_rol_personas_on_rol_persona", unique: true, using: :btree
  add_index "rol_personas", ["tipo_persona_id"], name: "index_rol_personas_on_tipo_persona_id", using: :btree

  create_table "ruta_transportes", force: :cascade do |t|
    t.string   "clave_ruta",  limit: 10
    t.string   "nombre_ruta", limit: 50
    t.decimal  "kilometraje",            precision: 8, scale: 3
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.integer  "punto_a_id"
    t.integer  "punto_b_id"
  end

  create_table "t1", id: false, force: :cascade do |t|
    t.integer "id"
    t.string  "creatime", limit: 15
  end

  create_table "t2", id: false, force: :cascade do |t|
    t.integer "id"
    t.integer "seq"
    t.string  "creatime", limit: 15
  end

  create_table "tipo_datos", force: :cascade do |t|
    t.string   "tipo_dato"
    t.string   "dataprot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tipo_datos", ["tipo_dato"], name: "index_tipo_datos_on_tipo_dato", unique: true, using: :btree

  create_table "tipo_personas", force: :cascade do |t|
    t.string   "tipo_persona"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "tipo_personas", ["tipo_persona"], name: "index_tipo_personas_on_tipo_persona", unique: true, using: :btree

  create_table "tipo_vehiculos", force: :cascade do |t|
    t.string   "clave_tipo_vehiculo", limit: 6
    t.string   "tipo_vehiculo"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "tipo_vehiculos", ["clave_tipo_vehiculo"], name: "index_tipo_vehiculos_on_clave_tipo_vehiculo", unique: true, using: :btree

  create_table "usuarios", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree

  create_table "vehiculos", force: :cascade do |t|
    t.string   "serie"
    t.string   "placas",              limit: 12
    t.integer  "persona_id"
    t.integer  "tipo_vehiculo_id"
    t.integer  "marca_vehiculo_id"
    t.integer  "modelo_vehiculo_id"
    t.integer  "estado_operativo_id"
    t.hstore   "caracteristicas"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "ano_vehiculo"
  end

  add_index "vehiculos", ["caracteristicas"], name: "vehiculos_caracteristicas", using: :gin
  add_index "vehiculos", ["estado_operativo_id"], name: "index_vehiculos_on_estado_operativo_id", using: :btree
  add_index "vehiculos", ["marca_vehiculo_id"], name: "index_vehiculos_on_marca_vehiculo_id", using: :btree
  add_index "vehiculos", ["modelo_vehiculo_id"], name: "index_vehiculos_on_modelo_vehiculo_id", using: :btree
  add_index "vehiculos", ["persona_id"], name: "index_vehiculos_on_persona_id", using: :btree
  add_index "vehiculos", ["tipo_vehiculo_id"], name: "index_vehiculos_on_tipo_vehiculo_id", using: :btree

  create_table "viajes", force: :cascade do |t|
    t.string   "origen"
    t.string   "destino"
    t.integer  "distancia"
    t.decimal  "combustible"
    t.decimal  "Peaje"
    t.decimal  "gasto_extra"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_foreign_key "caracter_rol_personas", "rol_personas"
  add_foreign_key "caracter_rol_personas", "tipo_datos"
  add_foreign_key "caracter_tipo_personas", "tipo_datos"
  add_foreign_key "caracter_tipo_personas", "tipo_personas"
  add_foreign_key "caracteristica_forma_contactos", "forma_contactos"
  add_foreign_key "caracteristica_forma_contactos", "tipo_datos"
  add_foreign_key "caracteristica_tipo_vehiculos", "tipo_datos"
  add_foreign_key "caracteristica_tipo_vehiculos", "tipo_vehiculos"
  add_foreign_key "estados", "nacions"
  add_foreign_key "localidads", "estados"
  add_foreign_key "modelo_vehiculos", "marca_vehiculos"
  add_foreign_key "modelo_vehiculos", "tipo_vehiculos"
  add_foreign_key "personas", "rol_personas"
  add_foreign_key "personas", "tipo_personas"
  add_foreign_key "rol_personas", "tipo_personas"
  add_foreign_key "vehiculos", "estado_operativos"
  add_foreign_key "vehiculos", "marca_vehiculos"
  add_foreign_key "vehiculos", "modelo_vehiculos"
  add_foreign_key "vehiculos", "personas"
  add_foreign_key "vehiculos", "tipo_vehiculos"
end
