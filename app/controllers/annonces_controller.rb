class AnnoncesController < ApplicationController
  before_action :set_annonce, only: %i[ show edit update destroy ]

  # GET /annonces or /annonces.json
  def index
    @annonces = Annonce.all
  end

  # GET /annonces/1 or /annonces/1.json
  def show
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
    @annonce = Annonce.new(annonce_params)

    if params[:photo].present?
      params[;photo].each do |file|
        @annonce.photo.attach(file)
      end
    end

    @annonce.utilisateur = current_user

    respond_to do |format|
      if @annonce.save
        format.html { redirect_to annonce_url(@annonce), notice: "Annonce was successfully created." }
        format.json { render :show, status: :created, location: @annonce }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @annonce.errors, status: :unprocessable_entity }
      end
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
    @annonce.destroy

    respond_to do |format|
      format.html { redirect_to annonces_url, notice: "Annonce was successfully destroyed." }
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
      params.permit(:titre, :description, :adresse, :sous_categorie, :photo)
    end
end
