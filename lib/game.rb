require "pry"

class Game
  
    attr_accessor :human_player, :enemies

    def initialize(argu)
        @human_player = HumanPlayer.new(argu)
        
        @enemies = Array.new

        4.times do |player|
            player = Player.new("enemy#{player}")
            @enemies.push(player)
        end
    end

    def kill_player(player_dead)
        @enemies.each do |x|
            if player_dead == x.name
                @enemies.delete(x)
            end
        end
    end

    def is_still_ongoing?
        if @human_player.life_point > 0 && @enemies.length > 0
            return true
        else
            return false
        end
    end

    def show_players
        @Human_player.show_state
        puts "il reste #{@enemies.length} enemies"
    end

end