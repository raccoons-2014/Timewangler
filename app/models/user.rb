class User < ActiveRecord::Base
  has_secure_password

  has_one :deck
  has_many :games, foreign_key: :player_one_id
  has_many :games, foreign_key: :player_two_id

  validates :password, :presence => true, :length => { :within => 4..40 }
  validates :username, :presence => true, :length => { :within => 4..40 }, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  def count_wins
   wins = Game.where(winner_id: self.id).count
  end

  def count_losses
    losses = Game.where.not(winner_id: self.id).where("player_one_id = ? or player_two_id = ?", self.id, self.id).count
  end

  def win_loss_ratio
    if count_losses == 0 && count_wins > 0
      return count_wins
    elsif count_losses == 0 && count_wins == 0
      return "No completed games."
    else
      count_wins.to_f / count_losses.to_f
    end
  end

  def last_20_games
    games = Game.where.not(winner_id: nil).where("player_one_id = ? or player_two_id = ?", self.id, self.id).order(created_at: :asc).limit(20)
  end
end
