class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!, except: [:top, :about]
  def destroy
    Comment.find(params[:id]).destroy
    redirect_to admin_outfit_path(params[:outfit_id])
  end
end
