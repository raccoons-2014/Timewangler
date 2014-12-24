class GamesController < ApplicationController
  include GameHelper
  def new
  end

  def show
    @game = Game.find(params[:id])
  end

  def index
    @user1 = User.find(session[:user1_id])
    @user2 = User.find(session[:user2_id])
  end

end
