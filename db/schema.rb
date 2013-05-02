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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130402004217) do

  create_table "combustibles", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comunas", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "informaciones_bencina", :force => true do |t|
    t.string   "region"
    t.integer  "comuna_id"
    t.integer  "combustible_id"
    t.decimal  "precio_minimo",   :precision => 10, :scale => 2
    t.decimal  "precio_maximo",   :precision => 10, :scale => 2
    t.decimal  "precio_promedio", :precision => 10, :scale => 2
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  add_index "informaciones_bencina", ["combustible_id"], :name => "index_informaciones_bencina_on_combustible_id"

end
