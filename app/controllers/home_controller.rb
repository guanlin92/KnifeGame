class HomeController < ApplicationController
  def index
    if current_user
        @open_games=Game.where(:waiting_for_players => true)
        if @open_games.count == 0
          game = Game.new
          game.phase = 1
          game.waiting_for_players = true
          game.finished = false
          game.save
          @open_games=Game.where(:waiting_for_players => true)
        end
        redirect_to "/lobby/"
    else
      redirect_to "/"
    end
  end
  def player_join
    if current_user
      @game = Game.where(:id => :params[:id])
    else
      redirect_to "/home"
    end
  end
end
