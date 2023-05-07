class PagesController < ApplicationController
  def home
    @annonces = Annonce.all
    @utilisateur = utilisateur_courant 
  end

  def login
  end

  def register
  end
  
end
