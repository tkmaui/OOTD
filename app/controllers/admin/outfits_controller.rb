class Admin::OutfitsController < ApplicationController
  def index
    @outfits = Outfit.all
  end

  def show
    @outfit = Outfit.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    @outfit = Outfit.find(params[:id])
    @outfit.destroy
    redirect_to admin_outfits_path
  end
end
