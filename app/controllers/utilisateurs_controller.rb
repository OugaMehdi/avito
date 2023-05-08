class UtilisateursController < ApplicationController
  before_action :bon_utilisateur, only: [:edit, :update_info, :update_password]
  before_action :authenticate, :only => [:index, :edit, :update_info, :update_password, :destroy]

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
    @utilisateur = utilisateur_courant
    @villes = Ville.all
  end

  # POST /utilisateurs or /utilisateurs.json
  def create
    @utilisateur = Utilisateur.new(utilisateur_params)
    if @utilisateur.save
      flash[:success] = "Bienvenue !"
        redirect_to login_path
    else
      render 'new'
    end
  end

  # PATCH/PUT /utilisateurs/1 or /utilisateurs/1.json
  def update_info
    @villes = Ville.all
    @utilisateur = utilisateur_courant
    puts @utilisateur.inspect
    if @utilisateur.update(nom: params[:utilisateur][:nom], tel: params[:utilisateur][:tel], ville_id: params[:utilisateur][:ville_id].to_i)
      flash[:success] = "Modifications effectuées avec success"
      render 'edit'
    else
      flash[:error] = "Failed"
    end
  end


  def update_password
    @villes = Ville.all
    @utilisateur = utilisateur_courant
    if @utilisateur.authenticate(params[:utilisateur][:current_password])
      if @utilisateur.update(password: params[:utilisateur][:new_password])
        flash[:success] = "Mot de passe mis à jour avec succès."
        render 'edit'
      else
        flash[:danger] = "Erreur lors de la mise à jour du mot de passe."
        puts "update failed"
      end
    else
      flash[:danger] = "Mot de passe actuel incorrect."
      puts "authenticate failed"
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

    def password_params
      params.require(:utilisateur).permit(:current_password, :new_password, :new_password_confirmation)
    end
    
    def bon_utilisateur
      @utilisateur = utilisateur_courant
      redirect_to(root_url) unless @utilisateur == @utilisateur_courant
    end

end
