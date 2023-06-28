class Public::QuestionsController < ApplicationController
  before_action :authenticate_customer!, except: [:top, :about, :sign_up, :sign_in]
  def new
    @question = Question.new
  end

  def index
    @questions = Question.page(params[:page])
    @customers = Customer.page(params[:page])
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_params)
    @question.customer_id = current_customer.present? ? current_customer.id : 1
    if @question.save
       redirect_to questions_path
    else
      render :new
    end
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
        redirect_to questions_path
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  def search_for
    # 検索ボタンをクリックするとsearchアクションが呼び出され、入力した検索ワードをparams[:keyword]で取得できる
    if params[:keyword].present?
      # 入力した検索ワードがキャプション内に含まれる写真をすべて取得でき
      @questions = Question.where('title LIKE ?', "%#{params[:keyword]}%")
      # 入力した検索ワードを取得して検索結果表示画面で使用する
      @keyword = params[:keyword]
    else
      # 何も入力せずに検索ボタンをクリックした場合は、Photo.allですべての写真を取得する
      @questions = Question.all
    end
    @customers = Customer.all
  end

  private

  def question_params
    params.require(:question).permit(:title, :image, :caption)
  end
end
