class Customer::TrainersController < ApplicationController
  before_action :authenticate_customer!

  def index
    @trainers = Trainer.all.page(params[:page]).per(10)
    @favorites_rank = Trainer.joins(:favorites).group(:trainer_id).order('count(trainer_id)desc')
  end

  def show
    @trainer = Trainer.find(params[:id])
    @training_menus = @trainer.training_menus
    @favorites = Favorite.new
  end


  private

  def trainer_params
    params.require(:trainer).permit(:trainer_name, :trainer_introduction, :trainer_image_id, :rate, :gender)
  end



end
