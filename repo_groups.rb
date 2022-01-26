require_relative "group"
require "csv"

class RepoGroups
    attr_reader :groups
    def initialize
        @groups = []
        load_csv
        @next_id = @groups[-1].id + 1
    end
    def load_csv
        CSV.foreach("group.csv", headers: :first_row, header_converters: :symbol) do |row|
            row[:id] = row[:id].to_i
            
            @groups << Group.new(row)
        end
    end
end