class Public::CommentsController < ApplicationController
 before_action :authenticate_customer!, except: [:top, :about, :sign_up, :sign_in]
 def create
    @outfit = Outfit.find(params[:outfit_id])
    @comment = current_customer.comments.new(comment_params)
    @comment.outfit_id = @outfit.id
    # comment.save
    # redirect_to outfit_path(outfit)
    if @comment.save
       redirect_to outfit_path(@outfit)
    else
       render "public/outfits/show"
    end
 end

 def destroy
    Comment.find(params[:id]).destroy
    redirect_to outfit_path(params[:outfit_id])
 end

 private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
