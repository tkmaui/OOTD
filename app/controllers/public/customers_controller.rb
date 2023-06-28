class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!, except: [:top, :about, :sign_up, :sign_in]
  before_action :is_matching_login_customer, only: [:edit, :update]

  def index
    @customers = Customer.all
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
       redirect_to customer_path(@customer.id)
    else
      render :edit
    end
  end

  def show
    @customer = Customer.find(params[:id])
    @outfits = @customer.outfits.page(params[:page])
    @questions = @customer.questions.page(params[:page])
    favorites = Favorite.where(customer_id: @customer.id).pluck(:outfit_id)
    @favorite_outfits = Outfit.find(favorites)
  end




  def is_deleted
  end

  def withdraw
    @customer = current_customer

    @customer.destroy
    #セッション情報を全て削除（セキュリティ面のリスク回避のため）
    reset_session
    # flash[:info] = "退会処理を実行いたしました。"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:nickname, :profile_image, :gender, :tall, :introduction)
  end

  def is_matching_login_customer
    customer = Customer.find(params[:id])
    unless customer.id == current_customer.id
      redirect_to outfits_path
    end
  end
end
