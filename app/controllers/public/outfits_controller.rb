class Public::OutfitsController < ApplicationController
  def new
    @outfit = Outfit.new
  end

  def index
    @outfits = Outfit.all
  end

  def show
    @outfit = Outfit.find(params[:id])
  end

  def edit
    @outfit = Outfit.find(params[:id])
  end

  def create
    @outfit = Outfit.new(outfit_params)
    @outfit.customer_id = current_customer.id
    @outfit.save
    redirect_to outfits_path
  end

  def update
    @outfit = Outfit.find(params[:id])
    @outfit.update(outfit_params)
    redirect_to outfits_path
  end

  def destroy
    outfit = Outfit.find(params[:id])
    outfit.destroy
    redirect_to outfits_path
  end

  private

  def outfit_params
    params.require(:outfit).permit(:title, :image, :caption)
  end
end
