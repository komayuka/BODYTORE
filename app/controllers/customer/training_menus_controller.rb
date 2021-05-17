class Customer::TrainingMenusController < ApplicationController
  before_action :authenticate_customer!

 def show
   @training_menu = TrainingMenu.find(params[:id])
 end

end
