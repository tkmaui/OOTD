class Admin::QuestionsController < ApplicationController
  before_action :authenticate_admin!, except: [:top, :about]
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to admin_questions_path
  end
end
