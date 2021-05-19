class RakutenController < ApplicationController
  def search
    if params[:keyword]
      @items = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword])
      @items_full = []
     if @items_full.present?
       @items = Kaminari.paginate_array(@items_full).page(params[:page]).per(10)
     end
    end
  end
end
