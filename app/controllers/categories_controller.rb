class CategoriesController < ApplicationController

  # GET /categories or /categories.json
  def index
    @categories = Categorie.all
  end

  # GET /categories/1 or /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @categorie = Categorie.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories or /categories.json
  def create
    @categorie = Categorie.new(categorie_params)

    respond_to do |format|
      if @categorie.save
        format.html { redirect_to categorie_url(@categorie), notice: "Categorie was successfully created." }
        format.json { render :show, status: :created, location: @categorie }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @categorie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    respond_to do |format|
      if @categorie.update(categorie_params)
        format.html { redirect_to categorie_url(@categorie), notice: "Categorie was successfully updated." }
        format.json { render :show, status: :ok, location: @categorie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @categorie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @categorie.destroy

    respond_to do |format|
      format.html { redirect_to categories_url, notice: "Categorie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categorie
      @categorie = Categorie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def categorie_params
      params.fetch(:categorie, {})
    end
end
