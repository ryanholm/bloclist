class ListsController < ApplicationController
  #create new
  def new
    @list = List.new(params[:list])
  end

  def index
    @lists = List.all
  end

# - need to be able to create a list
  def create
    @list = List.new(list_params)
    if @list.save
      return redirect_to list_url(@list)
    else
      flash[:error] = "U is broken yo"
      return render :new
    end
  end

# - need to be able to edit a list
  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update_attributes(list_params)
      flash[:notice] = "List was updated."
      return redirect_to list_url(@list)
    else
      flash[:error] = "You messed it up idiot."
      return render :edit
    end
  end

# - need to be able to show a list
  def show
    @list = List.find(params[:id])
  end
# - need to be able to destroy a list
  def destroy
    @list = List.find(params[:id])
    @list.destroy
    flash[:notice] = "you have successfully destroyed."
    redirect_to root_url
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

end