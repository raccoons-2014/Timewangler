module GameHelper
  def open_games
    Game.where('player_one_id != ?', session[:user_id]).where(player_two_id: nil)
  end

  def open_games?
    open_games.any?
  end

  def match_found?(game)
    game.player_one != nil && game.player_two != nil
  end

  def clear_stale_games
    open_games = Game.where(player_two_id: nil)
    open_games.each { |game| game.destroy if Time.now - game.created_at > 120 }
  end

end
