class Trainer::RoomsController < ApplicationController
  before_action :authenticate_trainer!
  before_action :set_room, only: :show

  def index
    @customers = Customer.all.order(created_at: :desc)
  end

  def show
    @message = Message.new
    @messages = Message.where(room_id: @room.id)
  end


private

 def set_room
   @room = Room.find_by(params[:id])
 end

end
