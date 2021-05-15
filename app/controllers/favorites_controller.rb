class FavoritesController < ApplicationController
  def create
    @trainer = Trainer.find(params[:trainer_id])
    @favorite = current_customer.favorite.new(trainer_id: trainer.id)
    @favorite.save
    redirect_to trainer_path(trainer)
  end

  def destroy
    @trainer = Trainer.find(params[:trainer_id])
    @favorite = current_customer.favorites.find_by(trainer_id: trainer.id)
    @favorite.destroy
    redirect_to trainer_path(trainer)
  end
end
