class Customer::TrainingMenusController < ApplicationController
  before_action :authenticate_customer!

  def index
    @training_menus = TrainingMenu.all.order(created_at: 'DESC').page(params[:page]).per(5)
  end

  def show
    @training_menu = TrainingMenu.find(params[:id])
  end
end
