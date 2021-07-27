class WinesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_wine, only: %i[ show edit update destroy ]

  # GET /wines or /wines.json
  def index
    @wines = Wine.eager_load(:strains)
  end

  # GET /wines/1 or /wines/1.json
  def show
  end

  # GET /wines/new
  def new
    if current_user.admin?
      @wine = Wine.new
      @strains = Strain.eager_load(:wines)
      @wine.wines_strains.build
    else
      flash[:alert] = "You must be an admin in to access this section"
      redirect_to root_path
    end
  end

  # GET /wines/1/edit
  def edit
    if current_user.admin?
      @strains = Strain.eager_load(:wines)
    else
      flash[:alert] = "You must be an admin in to access this section"
      redirect_to root_path
    end
  end

  # POST /wines or /wines.json
  def create
    @wine = Wine.new(wine_params)
    sum = 0
    if not @wine.name.blank?
      @wine.wines_strains.each do |strain|
        sum = strain.proportion + sum
      end
    end

    respond_to do |format|
      if sum <= 100 && @wine.save
        format.html { redirect_to @wine, notice: "Wine was successfully created." }
        format.json { render :show, status: :created, location: @wine }
      elsif sum > 100
        format.html { redirect_to new_wine_path, alert: "Wine can only have a total of 100%" }
      else
        @strains = Strain.eager_load(:wines)
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @wine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wines/1 or /wines/1.json
  def update
    respond_to do |format|
      if @wine.update(wine_params)
        format.html { redirect_to @wine, notice: "Wine was successfully updated." }
        format.json { render :show, status: :ok, location: @wine }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @wine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wines/1 or /wines/1.json
  def destroy
    if current_user.admin?
      @wine.destroy
      respond_to do |format|
        format.html { redirect_to wines_url, notice: "Wine was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      flash[:alert] = "You must be an admin to delete a wine"
      redirect_to root_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wine
      @wine = Wine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wine_params
      params.require(:wine).permit(:name, wines_strains_attributes: [:id, :strain_id, :proportion])
    end
end
