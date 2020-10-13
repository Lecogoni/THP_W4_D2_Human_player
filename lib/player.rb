require "pry"

class Player

    attr_accessor :name, :life_point
    
    def initialize(name, life_point = 10)
        @name = name
        @life_point = life_point
    end

    
    def show_state
        return "#{name} a #{self.life_point} points de vie"
    end 

    def gets_damage(damage_number)
        #@damage_number = damage_number.to_i
        @life_point -= damage_number.to_i
        if self.life_point <= 0
            puts "le joeur #{self.name} à été tué"
        else
            puts "#{self.name} a #{self.life_point} points de vie"
            # puts "Voici l'état de nos joueurs :"
            # puts "#{player1.show_state}"
            # puts "#{player2.show_state}"
            # puts "#{hp.show_state}"
        end
    end

    def attacks(player)
        damages = compute_damage
        puts "#{self.name} attaque #{player.name} et lui inflige #{damages} points !" 
        player.gets_damage(damages)
    end

    def compute_damage
        return rand(1..6)
    end
end


class HumanPlayer < Player

    attr_accessor :weapon_level

    def initialize(name, life_point = 100, weapon_level = 1)
        @weapon_level = 1
        super(name, life_point) 
    end

    def show_state
        return "#{name} a #{self.life_point} points de vie et une arme de niveau #{self.weapon_level}"
    end

    def compute_damage
        return rand(1..6) * @weapon_level
    end

    def search_weapon
        weapon = rand(1..6)
        puts "Tu as trouvé une nouvelle arme de niveau #{weapon}"
        if @weapon_level < weapon
            puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends"
            @weapon_level = weapon
        elsif @weapon_level > weapon
            puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
        end 
    end

    def search_health_pack
        health = rand(1..6)
        if health == 1
            puts "Tu n'as rien trouvé... tu as #{self.life_point} points de vie"
        elsif health >= 2 && health <= 5
            @life_point += 50
            if @life_point > 100
                @life_point = 100
            end
            puts "Bravo, tu as trouvé un pack de +50 points de vie !, tu as maintenant #{self.life_point} points de vie"
        elsif health == 6
            @life_point += 80
            if @life_point > 100
                @life_point = 100
            end
            puts "Waow, tu as trouvé un pack de +80 points de vie !, tu as maintenant #{self.life_point} points de vie"
        end
    end

end