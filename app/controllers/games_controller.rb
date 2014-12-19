class GamesController < ApplicationController
  def new

  end

  def index
    @user1 = User.find(session[:user1_id])
    @user2 = User.find(session[:user2_id])
  end

end
