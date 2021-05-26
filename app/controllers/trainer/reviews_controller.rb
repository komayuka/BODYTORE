class Trainer::ReviewsController < ApplicationController
  before_action :authenticate_trainer!

  def index
    @reviews = Review.all
    @reviews = Review.order_by("DESC")
  end


end
