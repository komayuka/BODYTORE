class Customer::TrainersController < ApplicationController

  def index
    @trainers = Trainer.all
  end

  def show
    @trainer = Trainer.find(params[:id])
  end


  private

  def trainer_params
    params.require(:trainer).permit(:trainer_name, :trainer_introduction, :trainer_image_id, :rate, :gender)
  end



end
