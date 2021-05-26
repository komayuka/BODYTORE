class Trainer::TrainingMenusController < ApplicationController
  before_action :authenticate_trainer!
  before_action :set_trainer

  def new
    @training_menu = TrainingMenu.new
    # trainings一緒に保存
    @training_menu.trainings.build
  end

  def index
    @training_menu = TrainingMenu.new
    @training_menus = current_trainer.training_menus.page(params[:page]).per(8)
  end

  def show
    @training_menu = TrainingMenu.find(params[:id])
  end

  def create
    @training_menu = TrainingMenu.new(training_menu_params)
    # トレーニングメニューにトレーナーidを関連付け
    @training_menu.trainer_id = current_trainer.id
    if @training_menu.save
      flash[:success] = '編集が更新されました。'
      redirect_to trainer_training_menus_path(@trainer)
    else
      render 'new'
    end
  end

  def edit
    @training_menu = TrainingMenu.find(params[:id])
  end

  def update
    @training_menu = TrainingMenu.find(params[:id])
    if @training_menu.update(training_menu_params)
      flash[:success] = '編集が更新されました。'
      redirect_to trainer_training_menu_path
    else
      render 'edit'
    end
  end

  def destroy
    @training_menu = TrainingMenu.find(params[:id])
    if @training_menu.destroy
      redirect_to trainer_training_menus_path
    else
      render 'edit'
    end
  end

  private

  def training_menu_params
    params.require(:training_menu).permit(:trainer_id, :training_name, :category, :description, :training_menu_status,
                                          # トレーニングテーブルに必要なカラム
                                          trainings_attributes: %i[id training_status training_name training_description training_image _destroy])
  end

  def set_trainer
    @trainer = current_trainer
  end
end
