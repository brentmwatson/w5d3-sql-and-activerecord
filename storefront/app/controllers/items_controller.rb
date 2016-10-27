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
        @post = Post.new
        @post.title = [:title]
        @post.category = params[:item][:category]
        @post.description = params[:item][:description]
        @post.price = params[:item][:price]
        @post.save
        redirect_to root_path
    end
end
