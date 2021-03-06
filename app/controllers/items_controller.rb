class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :permited_user, only: [:edit, :update, :destroy]
  before_action :edit_cancel, only: :edit

  def index
      @items = Item.all.order("created_at DESC")
      
    end

    def new
      @item = Item.new
    end
 
    def create
      @item = Item.new(item_params)
      if @item.save
        redirect_to root_path
      else
        render :new
      end
    end

    def show
    end

    def edit
      
    end

    def update
      if @item.update(item_params)
       redirect_to item_path(@item)
      else
       render :edit
      end
   end

   def destroy
    if @item.user == current_user
    @item.destroy
    redirect_to root_path
    end
   end


    private
  def item_params
    params.require(:item).permit(
      :name, :description, :price, 
      :category_id, :status_id, 
      :shipping_method_id, :prefecture_id,
      :shipping_date_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

def permited_user
   redirect_to root_path unless current_user.id == @item.user_id
end



def edit_cancel
  redirect_to root_path if @item.item_user.present?
end

end


