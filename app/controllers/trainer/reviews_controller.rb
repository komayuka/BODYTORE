class Trainer::ReviewsController < ApplicationController
  before_action :authenticate_trainer!

  def index
    @trainer = current_trainer
    @reviews = @trainer.reviews.order(created_at: 'DESC').page(params[:page]).per(10)
    @reviews_all = @trainer.reviews
  end
end
