class Customer::TrainersController < ApplicationController
  before_action :authenticate_customer!

  def index
    @trainers = Trainer.all.page(params[:page]).per(10)
  end

  def show
    @trainer = Trainer.find(params[:id])
    @training_menus = @trainer.training_menus
    @favorites = Favorite.new
    @customer = current_customer
    @reviews = @trainer.reviews.order(created_at: 'DESC').limit(2)
  end

  private

  def trainer_params
    params.require(:trainer).permit(:trainer_name, :trainer_introduction, :trainer_image_id, :rate, :gender)
  end
end
