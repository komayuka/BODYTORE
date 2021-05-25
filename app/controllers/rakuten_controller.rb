class RakutenController < ApplicationController
  def search
    @items = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword]) if params[:keyword]
  end
end
