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

ActiveRecord::Schema.define(:version => 20120824014347) do

  create_table "authentications", :force => true do |t|
    t.integer  "usuario_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "authentications", ["token"], :name => "index_authentications_on_token", :unique => true
  add_index "authentications", ["uid"], :name => "index_authentications_on_uid", :unique => true
  add_index "authentications", ["usuario_id"], :name => "index_authentications_on_usuario_id", :unique => true

  create_table "avaliacoes", :force => true do |t|
    t.integer  "empresa_id"
    t.boolean  "status"
    t.integer  "usuario_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "avaliacoes", ["empresa_id"], :name => "index_avaliacoes_on_empresa_id"
  add_index "avaliacoes", ["usuario_id"], :name => "index_avaliacoes_on_usuario_id"

  create_table "cidades", :force => true do |t|
    t.string   "nome"
    t.string   "estado"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "cupons", :force => true do |t|
    t.integer  "usuario_id"
    t.integer  "premio_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "cupons", ["premio_id"], :name => "index_cupons_on_premio_id"
  add_index "cupons", ["usuario_id"], :name => "index_cupons_on_usuario_id"

  create_table "empresas", :force => true do |t|
    t.string   "nome"
    t.text     "info"
    t.integer  "setor_id"
    t.integer  "cidade_id"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.string   "link",       :default => "javascript:avoid(0);", :null => false
  end

  add_index "empresas", ["cidade_id"], :name => "index_empresas_on_cidade_id"
  add_index "empresas", ["setor_id"], :name => "index_empresas_on_setor_id"

  create_table "premios", :force => true do |t|
    t.string   "nome"
    t.integer  "valor"
    t.text     "info"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.boolean  "disponivel"
  end

  create_table "setores", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "usuarios", :force => true do |t|
    t.string   "email",              :default => "", :null => false
    t.integer  "sign_in_count",      :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "nome"
    t.string   "facebook_link"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.date     "aniversario"
    t.string   "escolaridade"
    t.string   "genero"
    t.string   "local"
    t.boolean  "permissao"
  end

  add_index "usuarios", ["email"], :name => "index_usuarios_on_email", :unique => true
  add_index "usuarios", ["facebook_link"], :name => "index_usuarios_on_facebook_link", :unique => true

end
