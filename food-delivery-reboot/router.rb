# TODO: implement the router of your app.
class Router
    def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
      @meals_controller = meals_controller
      @customers_controller = customers_controller
      @sessions_controller = sessions_controller 
      @orders_controller = orders_controller
    end

    def run
        condition = true

        @user = @sessions_controller.sign_in
        
        if @user.role == "delivery_guy"
            while condition
                puts "==============="
                puts "=====MENU======"
                puts "==============="
            
                puts "1. List my undelivered orders"
                puts "2. Mark order as delivered"
                puts "3. Exit"
                user_choice = gets.chomp.to_i

                case user_choice
                when 1 
                    @orders_controller.list_my_orders(@user)
                when 2 
                    @orders_controller.mark_as_delivered(@user)
                when 3 
                    condition = false
                end
            end
        else
            while condition
                puts "==============="
                puts "=====MENU======"
                puts "==============="
            
                puts "What do you want to do"
                puts "1. Add meal"
                puts "2. List meals"
                puts "3. Add customer"
                puts "4. List customers"
                puts "5. Add new order" 
                puts "6. List all undelivered orders"
                puts "7. Exit"
                user_choice = gets.chomp.to_i

                case user_choice
                when 1 
                    @meals_controller.add
                when 2 
                    @meals_controller.list
                when 3 
                    @customers_controller.add
                when 4 
                    @customers_controller.list
                when 5 
                    @orders_controller.add
                when 6 
                    @orders_controller.list_undelivered_orders
                when 7
                    condition = false
                end
            end
        end
    end
end