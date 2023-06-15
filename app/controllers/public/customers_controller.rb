class Public::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end
  
  def edit
  end
  
  def update
  end
  
  def show
  end
  
  def destroy
  end
  
  def is_deleted
  end
end
