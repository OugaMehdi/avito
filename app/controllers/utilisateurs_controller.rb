class UtilisateursController < ApplicationController

  before_action :authenticate, :only => [:index, :edit, :update, :destroy]

  # GET /utilisateurs or /utilisateurs.json
  def index
    @utilisateurs = Utilisateur.all
  end

  # GET /utilisateurs/1 or /utilisateurs/1.json
  def show
    @utilisateur = Utilisateur.find(params[:id])
  end

  # GET /utilisateurs/new
  def new
    @utilisateur = Utilisateur.new
    @villes = Ville.all
  end

  # GET /utilisateurs/1/edit
  def edit
    puts "params: #{params.inspect}"
    @utilisateur = Utilisateur.find(params[:id])
  end

  # POST /utilisateurs or /utilisateurs.json
  def create
    @utilisateur = Utilisateur.new(utilisateur_params)
    if @utilisateur.save
      flash[:success] = "Bienvenue !"
        redirect_to @utilisateur
    else
      render 'new'
    end
  end

  # PATCH/PUT /utilisateurs/1 or /utilisateurs/1.json
  def update
    @utilisateur = Utilisateur.find(params[:id])  
    if @utilisateur.update(utilisateur_params)
      flash[:success] = "Modifications effectuées avec success"
      redirect_to @utilisateur
    else
      render 'edit'
    end
  end

  # DELETE /utilisateurs/1 or /utilisateurs/1.json
  def destroy
    Utilisateur.find(params[:id]).destroy
	  flash[:success] = "Utilisateur supprimé"
	  redirect_to root_url
  end

  private
  
    # Only allow a list of trusted parameters through.
    def utilisateur_params
      params.require(:utilisateur).permit(:nom, :email, :tel, :password, :password_confirmation, :ville_id)
    end
    
    def bon_utilisateur
      @utilisateur = Utilisateur.find(params[:id])
      redirect_to(root_url) unless @utilisateur == @utilisateur_courant
    end

end
