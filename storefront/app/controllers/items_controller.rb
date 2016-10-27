class ItemsController < ApplicationController
    # displays all items
    def index
        @items = Item.all # .order id:
    end

    # creates a new item
    def new
        @items = item.new
    end

    def create
        @item = item.new
        @item.title = [:title]
        @item.category = params[:item][:category]
        @item.description = params[:item][:description]
        @item.price = params[:item][:price]
        @item.save
        redirect_to root_path
    end
end
