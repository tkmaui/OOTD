class Public::QuestionFavoritesController < ApplicationController
  before_action :authenticate_customer!, except: [:top, :about, :sign_up, :sign_in]
  def create
    question = Question.find(params[:question_id])
    question_favorite = current_customer.question_favorites.new(question_id: question.id)
    question_favorite.save
    redirect_to question_path(question)
  end

  def destroy
    question = Question.find(params[:question_id])
    question_favorite = current_customer.question_favorites.find_by(question_id: question.id)
    question_favorite.destroy
    redirect_to question_path(question)
  end
end
