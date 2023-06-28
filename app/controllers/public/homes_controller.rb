class Public::HomesController < ApplicationController
  before_action :authenticate_customer!, except: [:top, :about, :sign_up, :sign_in]
  def top
    @outfits = Outfit.page(params[:page])
  end

  def about
  end
end
