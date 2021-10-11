class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destory]
    def index
  
    end
  end

