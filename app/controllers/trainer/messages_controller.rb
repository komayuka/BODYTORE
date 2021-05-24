class Trainer::MessagesController < ApplicationController
  before_action :authenticate_trainer!

  def create
   message = Message.new(message_params)
    message.save
    redirect_to room_path(message.room_id)
  end

  private

  def message_params
    params.require(:message).permit(:message, :room_id).merge(trainer_id: current_trainer.id)
  end
end
