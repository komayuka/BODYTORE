class Customer::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer
    @trainer = Trainer.all
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:success] = '更新されました。'
      redirect_to customer_params
    else
      render 'edit'
    end
  end

  def destroy
    @customer = current_customer
    @customer.destroy
    flash[:success] = "会員退会しました。"
    redirect_to :root
  end

  def favories
    @favorited_trainer = current_customer.favorited_trainers
  end

  private

  def customer_params
    params.require(:customer).permit(:customer_name, :customer_image, :body_weight, :height, :age,
                                     :customer_introduction, :gender)
  end
end
