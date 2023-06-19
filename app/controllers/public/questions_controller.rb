class Public::QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_params)
    @question.customer_id = current_customer.present? ? current_customer.id : 1
    @question.save
    redirect_to questions_path
  end

  def update
    @question = Question(params[:id])
    @question.update(question_params)
    redirect_to questions_path
  end

  def destroy
    @question = Question(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :image, :caption)
  end
end
