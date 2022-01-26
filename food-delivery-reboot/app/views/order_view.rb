class OrderView
    def display(array)
        array.each_with_index do |order, index|
            puts "#{order.customer.name} #{order.meal.name}"
        end
    end
end