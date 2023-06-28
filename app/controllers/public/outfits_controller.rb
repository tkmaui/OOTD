class Public::OutfitsController < ApplicationController
  def new
    @outfit = Outfit.new
  end

  def index
    @outfits = Outfit.page(params[:page]).per(9)
    @customers = Customer.all
  end

  def show
    @outfit = Outfit.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @outfit = Outfit.find(params[:id])
  end

  def create
    @outfit = Outfit.new(outfit_params)
    @outfit.customer_id = current_customer.id
    if @outfit.save
       redirect_to outfits_path
    else
      render :new
    end
  end

  def update
    @outfit = Outfit.find(params[:id])
    if @outfit.update(outfit_params)
       redirect_to outfits_path
    else
       render :edit
    end
  end

  def destroy
    outfit = Outfit.find(params[:id])
    outfit.destroy
    redirect_to outfits_path
  end

  def search
    # 検索ボタンをクリックするとsearchアクションが呼び出され、入力した検索ワードをparams[:keyword]で取得できる
    if params[:keyword].present?
      # 入力した検索ワードがキャプション内に含まれる写真をすべて取得でき
      @outfits = Outfit.where('caption LIKE ?', "%#{params[:keyword]}%")
      # 入力した検索ワードを取得して検索結果表示画面で使用する
      @keyword = params[:keyword]
    else
      # 何も入力せずに検索ボタンをクリックした場合は、Photo.allですべての写真を取得する
      @outfits = Outfit.all
    end
    @customers = Customer.all
  end

  private

  def outfit_params
    params.require(:outfit).permit(:title, :image, :caption)
  end
end
