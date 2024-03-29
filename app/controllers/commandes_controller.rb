class CommandesController < ApplicationController
  

  # GET /commandes or /commandes.json
  def index
    @commandes = Commande.all
  end

  # GET /commandes/1 or /commandes/1.json
  def show
    @commandes = Commande.where(utilisateur_id: utilisateur_courant.id)
  end

  # GET /commandes/new
  def new
    @commande = Commande.new
  end

  # GET /commandes/1/edit
  def edit
  end

  # POST /commandes or /commandes.json
  def create
    @annonce = Annonce.find(params[:id])
    @commande = Commande.new(annonce_id: @annonce.id)
    @commande.utilisateur = utilisateur_courant
    if @commande.save
      redirect_to mescommandes_path, notice: 'La commande a été ajoutée.'
    else
      redirect_to root_path
    end
  end

  # PATCH/PUT /commandes/1 or /commandes/1.json
  def update
    respond_to do |format|
      if @commande.update(commande_params)
        format.html { redirect_to commande_url(@commande), notice: "Commande was successfully updated." }
        format.json { render :show, status: :ok, location: @commande }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @commande.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /commandes/1 or /commandes/1.json
  def destroy
    @commande.destroy

    respond_to do |format|
      format.html { redirect_to commandes_url, notice: "Commande was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_commande
      @commande = Commande.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def commande_params
      params.require(:commande).permit(:annonce_id)
    end
end
