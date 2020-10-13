require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#..... NEW PLAYER ....... 
army = []

player1 = Player.new("Josiane")
army << player1
player2 = Player.new("José")
army << player2
#print army


#.... WELCOME MESSAGE ....

puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "------------------------------------------------"
puts " "

#.... GET HUMAN PLAYER ....

puts "quel est ton nom ? "

input_name = gets.chomp

#..... NEW HUMAN PLAYER ....... 

hp = HumanPlayer.new(input_name)

#..... FIGHT ....... 

while (hp.life_point > 0) && (player1.life_point > 0 || player2.life_point > 0) 

    puts " "
    puts "==> #{hp.show_state}, #{player1.show_state}, #{player2.show_state}"
    puts " "
    puts "QUELLE ACTION VEUX TU EFFECTUER ?"
   
    sleep(1)

    puts " "
    puts "      a - chercher une meilleure arme"
    puts "      b - chercher à se soigner"
    puts " "
    puts "attaquer un joueur en vue :"
    puts " "
    puts "      c - #{player1.show_state}" 
    puts "      d - #{player2.show_state}"
    puts " "

    player_input = gets.chomp

    puts "------------------------------------------------------------------------------------------------"

    if player_input == "a"
        hp.search_weapon
    elsif player_input == "b"
        hp.search_health_pack
    elsif player_input == "c"
        hp.attacks(player1)
    else player_input == "d"
        hp.attacks(player2)
    end

    puts " "
    puts "Les autres joueurs t'attaquent !"
    puts " "

    army.each do |player|
        if player.life_point > 0
            player.attacks(hp)
            sleep(1)
        end
    end
end

puts " "
puts "La partie est finie"

if hp.life_point > 0
    puts "BRAVO ! TU AS GAGNE !"
else
    puts "Loser ! Tu as perdu !"
end


binding.pry