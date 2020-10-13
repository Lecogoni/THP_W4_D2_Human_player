require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


#..... NEW PLAYER ....... 

player1 = Player.new("nico")
player2 = Player.new("loupa")


#..... ATTACK V1 ....... 

puts "Voici l'état de nos joueur :\n\n"
puts player1.show_state
puts player2.show_state


while player1.life_point > 0 && player2.life_point > 0
    puts "Passons à la phase d'attaque :\n\n"
    player1.attacks(player2)
    if player2.life_point <= 0
        break
    end
    player2.attacks(player1)
    if player1.life_point <= 0
        break
    end
    puts "\n\n"
    puts "Voici l'état de nos joueur :\n\n"
    puts player1.show_state
    puts player2.show_state
    puts "\n\n"
end 




binding.pry