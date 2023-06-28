class Public::AnswersController < ApplicationController
 before_action :authenticate_customer!, except: [:top, :about, :sign_up, :sign_in]
 def new
  @answer = current_customer.answers.new
  @question = Question.find(params[:question_id])
 end

 def create
    @question = Question.find(params[:question_id])
    @answer = current_customer.answers.new(answer_params)
    @answer.question_id = @question.id
  if @answer.save
     redirect_to question_path(@question)
  else
    render :new
  end
 end

 def destroy
    Answer.find(params[:id]).destroy
    redirect_to question_path(params[:question_id])
 end

 private

  def answer_params
    params.require(:answer).permit(:answer, :image)
  end
end
