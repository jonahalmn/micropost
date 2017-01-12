class UsersController < ApplicationController

  def create
      @user = User.new(user_params)
      if @user.save
        flash[:success] = "Bienvenue dans Microposts"
        redirect_to @user
      else
        @titre = "Inscription"
        render 'new'
      end
    end


    def new
      @user = User.new
      @titre = "Inscription"
    end

  def show
    @user = User.find(params[:id])
    @titre = @user.nom
  end

private

  def user_params
        params.require(:user).permit(:nom, :email, :password, :password_confirmation)
  end

end
