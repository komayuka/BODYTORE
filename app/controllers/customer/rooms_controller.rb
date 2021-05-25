class Customer::RoomsController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_room_or_move, only: :show

  def index
    @trainers = Trainer.all.order(created_at: :desc)
  end

  def show
    @message =  Message.new
    @messages = Message.where(room_id: @room.id)
    @customer = Customer.find(params[:customer_id])
  end

  private

  def set_room_or_move
    @room = Room.find_by(params[:id])
  end
end
