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

ActiveRecord::Schema.define(version: 2023_04_30_225523) do

  create_table "annonces", force: :cascade do |t|
    t.string "adresse"
    t.boolean "masquerTel"
    t.string "etat"
    t.string "status"
    t.string "titre"
    t.string "description"
    t.string "photo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "utilisateur_id", null: false
    t.integer "sous_categorie_id", null: false
    t.index ["sous_categorie_id"], name: "index_annonces_on_sous_categorie_id"
    t.index ["utilisateur_id"], name: "index_annonces_on_utilisateur_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "nom_categorie"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "commandes", force: :cascade do |t|
    t.string "status_commande"
    t.integer "utilisateur_id", null: false
    t.integer "annonce_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["annonce_id"], name: "index_commandes_on_annonce_id"
    t.index ["utilisateur_id"], name: "index_commandes_on_utilisateur_id"
  end

  create_table "favoris", force: :cascade do |t|
    t.integer "utilisateur_id", null: false
    t.integer "annonce_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["annonce_id"], name: "index_favoris_on_annonce_id"
    t.index ["utilisateur_id"], name: "index_favoris_on_utilisateur_id"
  end

  create_table "sous_categories", force: :cascade do |t|
    t.string "nom_sous_categorie"
    t.integer "categorie_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["categorie_id"], name: "index_sous_categories_on_categorie_id"
  end

  create_table "utilisateurs", force: :cascade do |t|
    t.string "nom"
    t.string "email"
    t.integer "tel"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.integer "ville_id", null: false
    t.index ["ville_id"], name: "index_utilisateurs_on_ville_id"
  end

  create_table "villes", force: :cascade do |t|
    t.string "nom_ville"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "annonces", "sous_categories"
  add_foreign_key "annonces", "utilisateurs"
  add_foreign_key "commandes", "annonces"
  add_foreign_key "commandes", "utilisateurs"
  add_foreign_key "favoris", "annonces"
  add_foreign_key "favoris", "utilisateurs"
  add_foreign_key "sous_categories", "categories"
  add_foreign_key "utilisateurs", "villes"
end
