class SessionsView
  
  def display(employees)
    employees.each_with_index do |employee, index|
      puts "#{index + 1}. #{employee.username}"
    end
  end
  
  def ask_for_username
    puts "Whats is your username:"
    puts "--------------------------"
    gets.chomp
  end

  def ask_for_password
    puts "Whats is your password:"
    puts "--------------------------"
    gets.chomp
  end

  def wrong_credentials
    puts "Wrong credentials!!!"
  end

end
