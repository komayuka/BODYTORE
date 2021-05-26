class Customer::DiariesController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_customer

  def new
    @diary = Diary.new
    @customer = current_customer
  end

  def index
    @diary = Diary.new
    @diaries = current_customer.diaries
    @weight_data = @diaries.group_by_day(:start_time, series: false).sum(:weight)
    # series 記録しない日も維持
  end

  def show
    @diary = Diary.find(params[:id])
  end

  def create
    @diary = Diary.new(diary_params)
    @diary.customer_id = current_customer.id
    if @diary.save
      flash[:success] = '投稿されました。'
      redirect_to customer_diaries_path(@customer)
    else
      render 'new'
    end
  end

  def edit
    @diary = Diary.find(params[:id])
  end

  def update
    @diary = Diary.find(params[:id])
    if @diary.update(diary_params)
      flash[:success] = '更新されました。'
      redirect_to customer_diary_path
    else
      render 'edit'
    end
  end

  def destroy
    @diaries = Diary.find(params[:id])
    if @diaries.destroy
      redirect_to customer_diaries_path
    else
      render 'edit'
    end
  end

  private

  def set_customer
    @customer = current_customer
  end

  def diary_params
    params.require(:diary).permit(:start_time, :title, :content, :weight, :customer_id)
  end
end
