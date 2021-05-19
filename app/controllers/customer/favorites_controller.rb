class Customer::FavoritesController < ApplicationController

  def create
    @trainer = Trainer.find(params[:trainer_id])
    @favorite = current_customer.favorites.new(trainer_id: @trainer.id)
    @favorite.save
  end

  def destroy
    @trainer = Trainer.find(params[:trainer_id])
    @favorite = current_customer.favorites.find_by(trainer_id: @trainer.id)
    @favorite.destroy
  end
end