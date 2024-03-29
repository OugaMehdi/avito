class AnnoncesController < ApplicationController

  # GET /annonces or /annonces.json
  def index
  end

  # GET /annonces/1 or /annonces/1.json
  def show
    @annonce = Annonce.find(params[:id])
  end

  def myannonces
    @annonces = Annonce.joins(:utilisateur).where(utilisateur: utilisateur_courant)
  end

  # GET /annonces/new
  def new
    @annonce = Annonce.new
    @sous_categories = SousCategorie.all
  end

  # GET /annonces/1/edit
  def edit
    
  end

  # POST /annonces or /annonces.json
  def create
    # @annonce = Annonce.new(annonce_params)
    @annonce = Annonce.new(adresse: params[:adresse], prix: params[:prix], masquerTel: params[:masquerTel], titre: params[:titre], description: params[:description], sous_categorie_id: params[:sous_categorie_id], etat: params[:etat])
    @annonce.utilisateur = utilisateur_courant
    if params[:photo].present?
      params[:photo].each do |file|
        @annonce.photo.attach(file)
      end
    end

    if @annonce.save
      redirect_to root_path
    else
      render :new
    end

  end

  # PATCH/PUT /annonces/1 or /annonces/1.json
  def update
    respond_to do |format|
      if @annonce.update(annonce_params)
        format.html { redirect_to annonce_url(@annonce), notice: "Annonce was successfully updated." }
        format.json { render :show, status: :ok, location: @annonce }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @annonce.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /annonces/1 or /annonces/1.json
  def destroy
    @annonce = Annonce.find(params[:id])
    @annonce.destroy

    respond_to do |format|
      format.html { redirect_to myannonces_url, notice: "Annonce supprimé avec succès." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_annonce
      @annonce = Annonce.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def annonce_params
      params.permit(:titre,:masquerTel, :description,:etat, :adresse, :sous_categorie_id, :photo, :prix)
    end
end
