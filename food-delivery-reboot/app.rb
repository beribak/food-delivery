require_relative "router"
require_relative "app/controllers/meals_controller"
require_relative "app/repositories/meal_repository"
require_relative "app/controllers/customers_controller"
require_relative "app/repositories/customer_repository"
require_relative "app/controllers/sessions_controller"
require_relative "app/repositories/employee_repository"
require_relative "app/controllers/orders_controller"
require_relative "app/repositories/order_repository"

meal_repo = MealRepository.new("data/meals.csv")
customer_repo = CustomerRepository.new("data/customers.csv")
employee_repo = EmployeeRepository.new("data/employees.csv")
order_repo = OrderRepository.new("data/orders.csv", meal_repo, employee_repo, customer_repo)

meals_controller = MealsController.new(meal_repo)
customers_controller = CustomersController.new(customer_repo)
sessions_controller = SessionsController.new(employee_repo)

orders_controller = OrdersController.new(meal_repo, employee_repo, customer_repo, order_repo)

router = Router.new(meals_controller, customers_controller, sessions_controller, orders_controller)

router.run

