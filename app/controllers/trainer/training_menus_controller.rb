class Trainer::TrainingMenusController < ApplicationController

  def new
    @training_menu = TrainingMenu.new
  end

  def index
    @training_menu = TrainingMenu.new
    @training_menus = TrainingMenu.find(params[:id])
  end

  def show
    @training_menu = TrainingMenu.find(params[:id])
  end

  def create
    @training_menu = TrainingMenu.new(training_menu_params)
    if @training_menu.save
      redirect_to training_menus_path(@training_menu.id)
    else
      render "new"
    end
  end

  def edit
    @training_menu = TrainingMenu.find(params[:id])
  end

  def update
    @training_menu = TrainingMenu.find(params[:id])
    if @training_menu.update(training_menu.params)
      redirect_to training_menu_path
    else
      render "edit"
    end
  end

  private

  def training_menu_params
    params.require(:training_menu).permit(:training_id, :trainer_id, :customer_id, :training_name, :category, :description, :training_menu_status)
  end

end
