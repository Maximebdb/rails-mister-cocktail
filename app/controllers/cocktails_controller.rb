class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

  def index # GET /cocktails
    @cocktails = Cocktail.all
  end

  def show # GET /cocktails/:id
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def new # GET /cocktails/new
    @cocktail = Cocktail.new
  end

  def create # POST /cocktails
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit # GET /cocktails/:id/edit
  end

  def update # PATCH /cocktails/:id
    @cocktail.update(cocktail_params)
    redirect_to cocktail_path(@cocktail)
  end

  def destroy # DELETE /cocktails/:id
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private
  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

  def set_cocktail
      @cocktail = Cocktail.find(params[:id])
  end
end

