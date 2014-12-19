class UsersController < ApplicationController

  def new
  end

  def create
    @user1 = User.new user_params1
    @user2 = User.new user_params2
    if @user1.save
      session[:user1_id] = @user1.id
    end

    if @user2.save
      session[:user2_id] = @user2.id
    end

    new_game = Game.create(player_one: @user1, player_two: @user2)
    redirect_to game_path(new_game)

  end

  private
  def user_params1
    params.require(:user1).permit(:id, :username)
  end

  def user_params2
    params.require(:user2).permit(:id, :username)
  end
end
