class View
    def display(array)
        array.each_with_index do |meal, index|
            puts "#{index + 1} #{meal.name}"
        end
    end

    def ask_user_name
        p "What meal do you want to add?"
        gets.chomp
    end

    def ask_user_price
        p "What isd the price of meal you want to add?"
        gets.chomp
    end

    def ask_user_for_meal
        p "Choose a meal by the number"
        gets.chomp.to_i - 1
    end
end