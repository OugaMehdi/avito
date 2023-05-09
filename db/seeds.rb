# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

# Read the list of Moroccan cities from a CSV file
CSV.foreach('db\ma (1).csv') do |row|
  Ville.create(nom_ville: row[0])
end

CSV.foreach('db\Nouveau_document_texte.csv') do |row|
    SousCategorie.create(nom_sous_categorie: row[0], categorie_id:row[1])
  end