class ItemUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :information_form, only: [:index, :new]
  before_action :set_item, only: [:index, :create]
  
 
def index  
    redirect_to root_path unless current_user.id == @information.user_id
end

def new
  
end


def create
  @information = ItemUserAddress.new(item_user_params)
   if @information.valid?
      pay_item
      @information.save
      redirect_to root_path
    else
      render :index
   end
end




  private
  def item_user_params
    params.require(:item_user_address).permit(:postal_code, :prefecture_id, :city, :address, :apartment, :phone_number  ).merge(user_id: current_user.id , token: params[:token], item_id: params[:item_id])
  end


def information_form
  @information = ItemUserAddress.new
end

def set_item
  @item = Item.find(params[:item_id])
end




def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
      Payjp::Charge.create(
        amount: @item.price,
        card: item_user_params[:token],
        currency: 'jpy'
      ) 
   end
end