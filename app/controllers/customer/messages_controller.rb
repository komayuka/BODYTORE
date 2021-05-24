class Customer::MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    if message.save
      redirect_to customer_room_path(message.room_id)
    end

  end

  private
  def message_params
    params.require(:message).permit(:message, :room_id).merge(customer_id: current_customer.id)
  end


end
