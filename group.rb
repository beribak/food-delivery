require_relative "player"

class Group
    attr_accessor :id, :players
    def initialize(attr = {})
        @id = attr[:id] || nil
        @players = []
        @capacity = 4 
        @name = attr[:name] || ""
    end

    def at_capacity?
        @players.count >= @capacity
    end

    def add_player(player)
        if !at_capacity?
            player.group = self           
            @players << player 
        end
    end
end

group = Group.new(name: "a1")

player_1 = Player.new(name: "Stefan")

player_2 = Player.new(name: "Danko", skill_level: "4")

group.add_player(player_1)

group.add_player(player_2)

# p player_1

p group.players[1].name

