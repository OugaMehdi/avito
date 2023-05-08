class SousCategoriesController < ApplicationController

  # GET /sous_categories or /sous_categories.json
  def index
    @sous_categories = SousCategorie.all
  end

  # GET /sous_categories/1 or /sous_categories/1.json
  def show
  end

  # GET /sous_categories/new
  def new
    @sous_categorie = SousCategorie.new
  end

  # GET /sous_categories/1/edit
  def edit
  end

  # POST /sous_categories or /sous_categories.json
  def create
    @sous_categorie = SousCategorie.new(sous_categorie_params)

    respond_to do |format|
      if @sous_categorie.save
        format.html { redirect_to sous_categorie_url(@sous_categorie), notice: "Sous categorie was successfully created." }
        format.json { render :show, status: :created, location: @sous_categorie }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sous_categorie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sous_categories/1 or /sous_categories/1.json
  def update
    respond_to do |format|
      if @sous_categorie.update(sous_categorie_params)
        format.html { redirect_to sous_categorie_url(@sous_categorie), notice: "Sous categorie was successfully updated." }
        format.json { render :show, status: :ok, location: @sous_categorie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sous_categorie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sous_categories/1 or /sous_categories/1.json
  def destroy
    @sous_categorie.destroy

    respond_to do |format|
      format.html { redirect_to sous_categories_url, notice: "Sous categorie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sous_categorie
      @sous_categorie = SousCategorie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sous_categorie_params
      params.fetch(:sous_categorie, {})
    end
end
