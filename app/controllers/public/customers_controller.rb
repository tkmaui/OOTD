class Public::CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_path(@customer.id)
  end

  def show
    @customer = Customer.find(params[:id])
    @outfits = @customer.outfits
    @questions = @customer.questions
  end

  def destroy
  end

  def is_deleted
  end

  private

  def customer_params
    params.require(:customer).permit(:nickname, :profile_image, :gender, :tall, :introduction)
  end
end
