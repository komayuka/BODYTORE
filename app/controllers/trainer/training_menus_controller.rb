class Trainer::TrainingMenusController < ApplicationController

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
    redirect_to training_menus_path(@training_menu.id)
  end

  def edit
    @training_menu = TrainingMenu.find(params[:id])
  end

  def update
    @training_menu = TrainingMenu.find(params[:id])
    @training_menu.trainings.build
    @training_menu.trainer_id = current_trainer.id
    if @training_menu.update(training_menu_params)
      redirect_to training_menu_path
    else
      render "edit"
    end
  end

  private

  def training_menu_params
    params.require(:training_menu).permit(:training_name, :category, :description, :training_menu_status,
                                           #トレーニングテーブルに必要なカラム
                                           trainings_attributes: [:id, :training_status, :training_name, :training_description, :_destroy]
                                         )
  end

end
