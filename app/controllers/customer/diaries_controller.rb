class Customer::DiariesController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_customer

  def new
    @diary = Diary.new
    @customer = current_customer
  end

  def index
    @diary = Diary.new
    @diaries = Diary.all
    @weight = @diaries.map(&:weight)
    @dates = @diaries.map{|diary| diary.created_at.strftime('%Y/%m/%d')}

  end

  def show
    @diary = Diary.find(params[:id])
  end

  def create
    @diary = Diary.new(diary_params)
    @diary.customer_id = current_customer.id
    if @diary.save
      flash[:notice] = "投稿されました。"
      redirect_to customer_diaries_path(@customer)
    else
      render "new"
    end
  end


  def edit
    @diary = Diary.find(params[:id])
  end

  def update
    @diary = Diary.find(params[:id])
    if @diary.update(diary_params)
       flash[:notice] = "更新されました。"
      redirect_to customer_diary_path
    else
      render "edit"
    end
  end

  def destroy
    @diaries = Diary.find(params[:id])
    if @diaries.destroy
      redirect_to customer_diaries_path
    else
      render "edit"
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
