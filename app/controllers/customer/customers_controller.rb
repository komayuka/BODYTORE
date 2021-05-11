class Customer::CustomersController < ApplicationController


  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customer_params
    else
      render "edit"
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:customer_name, :customer_image, :body_weight, :height, :age, :customer_introduction, :gender)
  end


end