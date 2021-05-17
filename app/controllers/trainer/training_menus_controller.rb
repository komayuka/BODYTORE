class Trainer::TrainingMenusController < ApplicationController
  before_action :authenticate_trainer!
  before_action :set_trainer

  def new
    @training_menu = TrainingMenu.new
    #trainings一緒に保存
    @training_menu.trainings.build
  end

  def index
    @training_menu = TrainingMenu.new
    @training_menus = TrainingMenu.all
  end

  def show
    @training_menu = TrainingMenu.find(params[:id])
  end

  def create
    @training_menu = TrainingMenu.new(training_menu_params)
    #トレーニングメニューにトレーナーidを関連付け
    @training_menu.trainer_id = current_trainer.id
    @training_menu.save
    redirect_to trainer_training_menus_path(@trainer)
  end

  def edit
    @training_menu = TrainingMenu.find(params[:id])
  end

  def update
    @training_menu = TrainingMenu.find(params[:id])
    if @training_menu.update(training_menu_params)
      redirect_to trainer_training_menu_path
    else
      render "edit"
    end
  end

  private

  def training_menu_params
    params.require(:training_menu).permit(:trainer_id, :training_name, :category, :description, :training_menu_status,
                                           #トレーニングテーブルに必要なカラム
                                           trainings_attributes: [:id, :training_status, :training_name, :training_description, :training_image, :_destroy]
                                         )
  end

  def set_trainer
    @trainer = current_trainer
  end

end
