class Trainer::TrainersController < ApplicationController
  before_action :authenticate_trainer!

  def show
    @trainer = current_trainer
    @favorite = Favorite.new
  end

  def edit
    @trainer = current_trainer
  end

  def update
    @trainer = current_trainer
    if @trainer.update(trainer_params)
      flash[:notice] = "更新されました。"
      redirect_to trainer_params
    else
      render "edit"
    end
  end



  private

  def trainer_params
    params.require(:trainer).permit(:trainer_name, :trainer_introduction, :age, :trainer_image)
  end


end
