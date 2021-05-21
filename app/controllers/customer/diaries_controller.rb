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
  end

  def show
    @diaries = Diary.find(params[:id])
  end

  def update
    @diary = current_customer.diaries.find(params[:id])
    @diary.update(update_params)
    redirect_to diaries_path(@customer.id)
  end

  def create
    @diary = current_customer.diaries.new(diary_memo)
    if @diary.save
      redirect_to diaries_path(@customre.id)
    else
      render "new"
    end
  end

  def edit
    @diary = current_customer.diaries.find(params[:id])
  end

  def destroy
    @diaries = current_customer.diaries.find(params[:id])
    @diaries.destroy
    redirect_to diaries_path(@customer.id)
  end

  private

  def diary_memo
    params.permit(:start_time, :title, :content, :weight, :customer_id)
  end

  def set_customer
    @customer = current_customer
  end

  def update_params
    params.require(:diary).permit(:start_time, :title, :content, :weight, :customer_id)
  end


end
