class Public::CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_path(@customer.id)
  end

  def show
    @customer = Customer.find(params[:id])
    @outfits = @customer.outfits
    @questions = @customer.questions
    favorites = Favorite.where(customer_id: @customer.id).pluck(:outfit_id)
    @favorite_outfits = Outfit.find(favorites)
  end


  

  def is_deleted
  end
  
  def withdraw
    @customer = current_customer
    # is_deletedカラムをtrueにupdate
    @customer.update(is_deleted: true)
    #セッション情報を全て削除（セキュリティ面のリスク回避のため）
    reset_session
    # flash[:info] = "退会処理を実行いたしました。"
    redirect_to root_path
  end
  
  private

  def customer_params
    params.require(:customer).permit(:nickname, :profile_image, :gender, :tall, :introduction)
  end
end
