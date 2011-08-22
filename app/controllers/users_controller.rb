class UsersController < ApplicationController

  before_filter :filter_authenticate, :only => [:edit, :update, :index]
  before_filter :filter_correct_user, :only => [:edit, :update]
  before_filter :filter_admin_user, :only => :destroy


  def index 
    @users = User.paginate(:page => params[:page])
    @title = "All Users"
  end

  def edit
    @title = "Edit Profile"
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  def new
    @title = "Subscribe Now"
    @user = User.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Proile updated."
      redirect_to @user
    else
      @title = "Edit Profile"
      render 'edit'
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in(@user)
      flash[:success] = "Welcome to the MOB"
      redirect_to @user
    else 
      @title = "Subscribe"
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_path
  end

  private

    def filter_authenticate
      deny_access unless signed_in?
    end

    def filter_correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def filter_admin_user
      redirect_to(root_path) unless current_user.admin?
    end

end
