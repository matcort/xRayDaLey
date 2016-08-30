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

ActiveRecord::Schema.define(version: 20160630165903) do

  create_table "infoleys", force: :cascade do |t|
    t.string   "numero_ley"
    t.datetime "fecha"
    t.string   "tipo"
    t.text     "exp_simpl"
    t.text     "cont_ley"
    t.text     "proy_ley"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "pais"
  end

  create_table "informacion_leys", force: :cascade do |t|
    t.string   "numero_ley"
    t.datetime "fecha"
    t.string   "tipo"
    t.text     "explicacion_simplificada"
    t.text     "contenido_ley"
    t.text     "proyecto_ley"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "microposts", force: :cascade do |t|
    t.string   "nombre"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "num"
  end

end
