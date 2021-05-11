class Trainer::TrainersController < ApplicationController

  def show
    @trainer = current_trainer
  end

  def edit
    @trainer = current_trainer
  end

  def update
    @trainer = current_trainer
    if @trainer.update(trainer_params)
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
