class Public::AnswersController < ApplicationController
 def create
    question = Question.find(params[:question_id])
    answer = current_customer.answers.new(answer_params)
    answer.question_id = question.id
    answer.save
    redirect_to question_path(question)
 end

 def destroy
    Answer.find(params[:id]).destroy
    redirect_to question_path(params[:question_id])
 end

 private

  def answer_params
    params.require(:answer).permit(:answer)
  end
end
