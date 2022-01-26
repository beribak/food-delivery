
class Player

    attr_accessor :group, :id, :name
    def initialize(attr = {})
        @id = attr[:id] || nil
        @name = attr[:name] || ""
        @skill_level = attr[:skill_level] || "1"
        @group = attr[:group] || false
    end

end
