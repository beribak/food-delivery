require "csv"
require_relative "player"
require_relative "group"
require_relative "repo_groups"

class RepoPlayers
    attr_reader :players
    def initialize
        @players = []
        load_csv
        @next_id = @players[-1].id + 1
    end

    def load_csv
        CSV.foreach("player.csv", headers: :first_row, header_converters: :symbol) do |row|
            row[:id] = row[:id].to_i
            
            if row[:group] == "false"
                row[:group] = false 
            end

            RepoGroups.new.groups.each do |group|
                if group.id == row[:group].to_i 
                    row[:group] = group         
                end
                @players << Player.new(row)
            end
    
        end
    end
    
    def create_player(name, skill_level)
        player = Player.new(name: name, skill_level: skill_level)
        player.id = @next_id
        @next_id += 1
        @players << player
    end
    
end

repo = RepoPlayers.new

repo.create_player("Daan", "3")
repo.create_player("Ofer", "1")

p repo