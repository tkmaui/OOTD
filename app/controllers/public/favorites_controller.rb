class Public::FavoritesController < ApplicationController
  def create
    outfit = Outfit.find(params[:outfit_id])
    favorite = current_customer.favorites.new(outfit_id: outfit.id)
    favorite.save
    redirect_to outfit_path(outfit)
  end

  def destroy
    outfit = Outfit.find(params[:outfit_id])
    favorite = current_customer.favorites.find_by(outfit_id: outfit.id)
    favorite.destroy
    redirect_to outfit_path(outfit)
  end
end
