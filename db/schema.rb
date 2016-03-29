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

ActiveRecord::Schema.define(version: 20160326035736) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "caracter_rol_personas", force: :cascade do |t|
    t.string   "caracteristica", limit: 48
    t.boolean  "requerido"
    t.integer  "rol_persona_id"
    t.integer  "tipo_dato_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "caracter_rol_personas", ["rol_persona_id"], name: "index_caracter_rol_personas_on_rol_persona_id", using: :btree
  add_index "caracter_rol_personas", ["tipo_dato_id"], name: "index_caracter_rol_personas_on_tipo_dato_id", using: :btree

  create_table "caracter_tipo_personas", force: :cascade do |t|
    t.string   "caracteristica",  limit: 48
    t.boolean  "requerido"
    t.integer  "tipo_dato_id"
    t.integer  "tipo_persona_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "caracter_tipo_personas", ["tipo_dato_id"], name: "index_caracter_tipo_personas_on_tipo_dato_id", using: :btree
  add_index "caracter_tipo_personas", ["tipo_persona_id"], name: "index_caracter_tipo_personas_on_tipo_persona_id", using: :btree

  create_table "estados", force: :cascade do |t|
    t.string   "nombre_estado"
    t.integer  "nacion_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "estados", ["nacion_id"], name: "index_estados_on_nacion_id", using: :btree

  create_table "localidads", force: :cascade do |t|
    t.string   "nombre_localidad"
    t.integer  "estado_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "localidads", ["estado_id"], name: "index_localidads_on_estado_id", using: :btree

  create_table "nacions", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
  add_foreign_key "estados", "nacions"
  add_foreign_key "localidads", "estados"
  add_foreign_key "personas", "rol_personas"
  add_foreign_key "personas", "tipo_personas"
  add_foreign_key "rol_personas", "tipo_personas"
end
