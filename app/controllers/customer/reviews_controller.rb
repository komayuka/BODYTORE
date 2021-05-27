class Customer::ReviewsController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_customer

  def new
    @review = Review.new
    @trainer = Trainer.find(params[:trainer_id])
  end

  def index
    @review = Review.new
    @reviews = Review.all.order(created_at: "DESC").page(params[:page]).per(10)
    @reviews_all = Review.all
  end

  def create
    @review = Review.create(review_params)
    @review.customer_id = current_customer.id
    @review.trainer_id = params[:trainer_id]
    if @review.save
      flash[:success] = '登録されました。'
     redirect_to file: "customer/trainers/index"
    else
     render 'new'
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:success] = '変更されました。'
      redirect_to customer_trainer_reviews_path
    else
      render 'edit'
    end
  end

  def destroy
    @reviews = Review.find(params[:id])
    @reviews.destroy
    redirect_to customer_trainer_reviews_path
  end

  private

  def set_customer
    @customer = current_customer
  end

  def review_params
    params.require(:review).permit(:title, :body, :customer_id, :trainer_id)
  end

end
