class UsersController < ApplicationController

  def index 
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  def new
    @title = "Subscribe Now"
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to the MOB"
      redirect_to @user
    else 
      @title = "Subscribe Now"
      render 'new'
    end
  end

end
