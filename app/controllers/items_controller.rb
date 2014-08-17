class ItemsController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @item = @list.items.build(params[:item])
  end

  def create
    @list = List.find(params[:list_id])
    @item = @list.items.build(item_params)
    if @item.save
      return redirect_to list_url(@item.list.id)
    else
      flash[:error] = "U is broken again yo"
      return render :new
    end
  end

  def index
    @items = Item.all
  end

  def show
    @items = Item.find(params[:id])
  end

   private

  def item_params
    params.require(:item).permit(:name)
  end
end
