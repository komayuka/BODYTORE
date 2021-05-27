class Trainer::ReviewsController < ApplicationController
  before_action :authenticate_trainer!

  def index
    @reviews = Review.all.order(created_at: 'DESC').page(params[:page]).per(10)
    @reviews_all = Review.all
  end
end
