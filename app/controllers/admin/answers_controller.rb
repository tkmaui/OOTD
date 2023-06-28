class Admin::AnswersController < ApplicationController
 before_action :authenticate_admin!, except: [:top, :about]
 def destroy
    Answer.find(params[:id]).destroy
    redirect_to admin_question_path(params[:question_id])
 end
end
