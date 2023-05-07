class PagesController < ApplicationController
  def home
    @annonces = Annonce.all
    @annonces = Annonce.where(sous_categorie_id: params[:sous_categorie]) if params[:sous_categorie].present?
    @annonces = Annonce.where("titre LIKE?", "%#{params[:search]}") if params[:search].present?
    @annonces = Annonce.joins(:utilisateur).where(utilisateur: {ville_id: params[:ville]}) if params[:ville].present?
    @annonces = Annonce.joins(:sous_categorie).where(sous_categorie: {categorie_id: params[:categorie]}) if params[:categorie].present?
    @utilisateur = utilisateur_courant
    @inf = Categorie.find(1)
    @hab = Categorie.find(2)
    @veh = Categorie.find(3) 
    @loi = Categorie.find(4)
    @imm = Categorie.find(5)
    @pou = Categorie.find(6)
    @emp = Categorie.find(7)
    @ent = Categorie.find(8)
    @ven = Categorie.find(9)
    @aut = Categorie.find(10)

    @villes = Ville.all

  end

  def login
  end

  def register
  end
  
end
