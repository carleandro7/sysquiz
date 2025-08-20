# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_08_11_131000) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "alunos", force: :cascade do |t|
    t.string "nome"
    t.bigint "instituica_id", null: false
    t.bigint "escola_id", null: false
    t.bigint "serieano_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "password_digest"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_alunos_on_email", unique: true
    t.index ["escola_id"], name: "index_alunos_on_escola_id"
    t.index ["instituica_id"], name: "index_alunos_on_instituica_id"
    t.index ["reset_password_token"], name: "index_alunos_on_reset_password_token", unique: true
    t.index ["serieano_id"], name: "index_alunos_on_serieano_id"
    t.index ["username"], name: "index_alunos_on_username", unique: true
  end

  create_table "escolas", force: :cascade do |t|
    t.string "nome"
    t.string "codinep"
    t.bigint "instituica_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instituica_id"], name: "index_escolas_on_instituica_id"
  end

  create_table "instituicas", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "provalunos", force: :cascade do |t|
    t.bigint "prova_id", null: false
    t.bigint "aluno_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "inicio"
    t.index ["aluno_id"], name: "index_provalunos_on_aluno_id"
    t.index ["prova_id"], name: "index_provalunos_on_prova_id"
  end

  create_table "provaquestaos", force: :cascade do |t|
    t.bigint "prova_id", null: false
    t.bigint "aluno_id", null: false
    t.bigint "questao_id", null: false
    t.string "resposta"
    t.string "embaralhada"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aluno_id"], name: "index_provaquestaos_on_aluno_id"
    t.index ["prova_id"], name: "index_provaquestaos_on_prova_id"
    t.index ["questao_id"], name: "index_provaquestaos_on_questao_id"
  end

  create_table "provas", force: :cascade do |t|
    t.string "titulo"
    t.text "descricao"
    t.datetime "data_inicio"
    t.datetime "data_fim"
    t.time "tempo_prova"
    t.bigint "instituica_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tempo_limite", default: 120, null: false
    t.index ["instituica_id"], name: "index_provas_on_instituica_id"
  end

  create_table "questaos", force: :cascade do |t|
    t.text "enuciado"
    t.text "letra_a"
    t.text "letra_b"
    t.text "letra_c"
    t.text "letra_d"
    t.text "letra_e"
    t.string "alternativa_correta"
    t.bigint "prova_id", null: false
    t.bigint "instituica_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instituica_id"], name: "index_questaos_on_instituica_id"
    t.index ["prova_id"], name: "index_questaos_on_prova_id"
  end

  create_table "serieano_provas", force: :cascade do |t|
    t.bigint "serieano_id", null: false
    t.bigint "prova_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prova_id"], name: "index_serieano_provas_on_prova_id"
    t.index ["serieano_id"], name: "index_serieano_provas_on_serieano_id"
  end

  create_table "serieanos", force: :cascade do |t|
    t.string "nome"
    t.bigint "escola_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["escola_id"], name: "index_serieanos_on_escola_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "nome"
    t.integer "tipo"
    t.string "telefone"
    t.integer "status"
    t.bigint "instituica_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["instituica_id"], name: "index_users_on_instituica_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "alunos", "escolas"
  add_foreign_key "alunos", "instituicas"
  add_foreign_key "alunos", "serieanos"
  add_foreign_key "escolas", "instituicas"
  add_foreign_key "provalunos", "alunos"
  add_foreign_key "provalunos", "provas"
  add_foreign_key "provaquestaos", "alunos"
  add_foreign_key "provaquestaos", "provas"
  add_foreign_key "provaquestaos", "questaos"
  add_foreign_key "provas", "instituicas"
  add_foreign_key "questaos", "instituicas"
  add_foreign_key "questaos", "provas"
  add_foreign_key "serieano_provas", "provas"
  add_foreign_key "serieano_provas", "serieanos"
  add_foreign_key "serieanos", "escolas"
  add_foreign_key "users", "instituicas"
end
