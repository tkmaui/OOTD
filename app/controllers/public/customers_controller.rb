class Public::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def edit
    @customer = Customer.find(params[:id])
    
  end

  def update
    @customer = Customer.find(params[:id])
  end

  def show
    @customer = Customer.find(params[:id])
    @outfits = @customer.outfits
  end

  def destroy
  end

  def is_deleted
  end
end
