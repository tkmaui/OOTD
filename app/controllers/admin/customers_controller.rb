class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!, except: [:top, :about]
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
    @outfits = @customer.outfits
    @questions = @customer.questions
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer.id)
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:nickname, :profile_image, :gender, :tall, :introduction)
  end
end
