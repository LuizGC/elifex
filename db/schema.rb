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

ActiveRecord::Schema.define(:version => 20120817023233) do

  create_table "cidades", :force => true do |t|
    t.string   "nome"
    t.string   "estado"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "empresas", :force => true do |t|
    t.string   "nome"
    t.text     "info"
    t.integer  "setor_id"
    t.integer  "cidade_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "empresas", ["cidade_id"], :name => "index_empresas_on_cidade_id"
  add_index "empresas", ["setor_id"], :name => "index_empresas_on_setor_id"

  create_table "setores", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
