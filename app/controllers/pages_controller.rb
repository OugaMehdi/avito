class PagesController < ApplicationController
  def home
    @annonces = Annonce.includes(:sous_categorie, utilisateur: :ville).all
    @utilisateur = utilisateur_courant
  end

  def login
  end

  def register
  end
  
end
