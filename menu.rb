$LOAD_PATH << "."
require 'company'
require 'users'
require 'income'
require 'expenses'
require 'main'

class Menue
    attr_accessor :menus
    
    def self.initialize(menus)
        @menus = menus
    end

    def self.manager()
    puts "-----Manager operation-----"
    menus = ["Print all companys", "Add new company","Remove company","Add user","Remove user","Print all users","Print all userlog","Logout","add income","remove income","print all income transactions","add expenses","remove expenses","print all the list of all expenses","add all expenses","add all income","difference between expensise and income"]
    menus.each_with_index do | menu,index |
      puts "#{index} -- #{menu}"
    end
    decision = gets.chomp
    case decision.to_i
    when 0
    #Print all cars
    Car.printAllcars(1)
    when 1
    #Add new car
    Car.addCar(1)
    when 2
    #Remove cars
    Car.removeCar(1)
    when 3
    #Add user
    Users.addUser(1)
    when 4
    #Remove user
    Users.removeUser(1)
    when 5
    #Print all users
    Users.printAllUsers(1)
    when 6
    printUserlog(1)
    when 7
    smenu()
    when 8
    Income.addCar(1)
    when 9
    Income.removeCar(1)
    when 10
    Income.printAllcars(1)
    when 11
    Expenses.addCar(1)
    when 12
    Expenses.removeCar(1)
    when 13
    Expenses.printAllcars(1)
    when 14
    Expenses.exp(1)     
    when 15
    Income.exp(1)
    when 16
    Expenses.diff(1)
    else
    puts "You put something wrong"
    manager()
    end
  end

  def self.staff()
    puts "-----staff operation-----"
    menus = ["Print all companys", "Add new company","Remove company","Add user","Remove user","Print all users","Print all userlog","Logout","add expenses","remove expenses","print all expenses","add all expenses"]
    menus.each_with_index do |menu,index|
      puts "#{index} -- #{menu}"
    end
    decision = gets.chomp
    case decision.to_i
    when 0
    #Print all cars
    Users.printAllcars(2)
    when 1
    #Add new car
    Users.addCar(2)
    when 2
    #Remove car
    Users.removeCar(2)
    when 3
    #Add user
    Users.addUser(2)
    when 4
    #Remove user
    Users.removeUser(2)
    when 5
    #Print all users
    Users.printAllUsers(2)
    when 6
    printUserlog(2)
    when 7
    smenu()
    when 8
    Income.addCar(2)
    when 9
    Income.removeCar(2)
    when 10
    Income.printAllcars(2)
    when 11
    Expenses.addCar(2)
    when 12
    Expenses.removeCar(2)
    when 13
    Expenses.printAllcars(2) 
    else
    puts "You put something wrong"
    staff()
    end
  end




  # authentication method to check and verify if username/password combination exists
  def self.auth_user(username, password)
    $users.each_with_index do |user_record, index|
      if user_record[:username] == username && user_record[:password] == password
        #push element to Current_user array
        if user_record[:role] == 1
          return manager()
        elsif user_record[:role] == 2
          return staff()
        else
          puts "Role did not find"
          smenu()
        end
      end
    end
    puts "Credential did not match!"
    smenu()
  end

  # program execution flow
  def self.smenu()
    puts "----- Welcome to car dealer shop -----"
    puts "Please enter your email and password"
    attempts = 1
    while attempts < 4
      puts "Username: "
      username = gets.chomp
      puts "Password: "
      password = gets.chomp
      authentication = auth_user(username, password)
      puts "Press n to quit or any other key to continue: "
      input = gets.chomp.downcase
      break if input == "n"
      attempts += 1
    end
    puts "You have exceeded the number of attempts" if attempts == 4
  end
  smenu()
end  

Menue.smenu()