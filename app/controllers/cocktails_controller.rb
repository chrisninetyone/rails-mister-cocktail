class CocktailsController < ApplicationController
  before_action :set_cocktails, only: [:show, :destroy]
  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)

    if @cocktail.save
      redirect_to cocktails_path
    else
      render :new
    end
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def set_cocktails
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
