class Admin::CommentsController < ApplicationController
  def destroy
    Comment.find(params[:id]).destroy
    redirect_to admin_outfit_path(params[:outfit_id])
  end
end
