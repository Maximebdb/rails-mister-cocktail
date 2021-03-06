class DosesController < ApplicationController
before_action :set_cocktail, only: [:new,:create]

  def new # GET /doses/new
  end

  def create # POST /doses
    @dose = @cocktail.doses.build(dose_params)
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail_id)
    else
      render :new
    end
  end

  def destroy # DELETE /doses/:id
    @dose = Dose.find(params['id'])
    @cocktail = Cocktail.find(@dose.cocktail_id)
    @dose.destroy
    redirect_to cocktail_path(@cocktail.id)
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params['cocktail_id'])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end
end
