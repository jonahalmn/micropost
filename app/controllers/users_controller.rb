class UsersController < ApplicationController
  def new
    @title = 'Inscription'
  end

  def show
    @user = User.find(params[:id])
    @titre = @user.nom
  end
end
