$LOAD_PATH << "."
require 'menu'
require 'company'
require 'income'
require 'expenses'
require 'main'
class Users
	attr_accessor :id, :username, :email, :userlogs, :reservations, :current_user, :tempCar, :tempUser


	$users = [
		{ username: "admin", email: "admin@anywhere.com" ,password: "admin", role: 1},
		{ username: "manager", email: "admin@anywhere.com" ,password: "manager", role: 1},
		{ username: "staff1", email: "admin@anywhere.com" ,password: "staff", role: 2},
		{ username: "staff2", email: "admin@anywhere.com" ,password: "staff", role: 2},
		{ username: "customer1", email: "admin@anywhere.com" ,password: "customer", role: 3},
		{ username: "customer2", email: "admin@anywhere.com" ,password: "customer", role: 3}
	]

	$cars = [
		{ brand: "test0", model:"test0" , seat: 2, av: 0},
		{ brand: "test1", model:"test1" , seat: 3, av: 0},
		{ brand: "test2", model:"test2" , seat: 2, av: 1},
		{ brand: "test3", model:"test3" , seat: 8, av: 1},
		{ brand: "test4", model:"test4" , seat: 4, av: 1},
		{ brand: "test5", model:"test5" , seat: 5, av: 1}
	]

	$income = [
		{id: "description", brand: "Company Name", model: 15, seat: "date", av: 1},
		{id: "description", brand: "Company Name", model: 15, seat: "date", av: 1}


	]

	$expenses = [
		{id: "description", brand: "Company Name", model: 10, seat: "date",},
		{id: "description", brand: "Company Name", model: 10, seat: "date",}


	]

	$userlogs = []
	$reservations = []
  $current_user=[]
	def initialize(users, cars, userlogs, reservations, current_user, tempCar, tempUser)
		@users = users
		@cars = cars
		@userlogs = userlogs
		@reservations = reservations
		@current_user = $current_user
		@tempCar = tempCar
		@tempUser = tempUser

	end


	def self.printAllUsers(permission)
		if permission.to_i == 1
        $users.each_with_index do |user,index|
          puts "#{index} -- username: #{user[:username]}, email: #{user[:email]}, password: #{user[:password]}, role: #{user[:role]}"
        end
		elsif permission.to_i == 2
        $users.each_with_index do |user, index|
          puts "#{index} -- username: #{user[:username]}, email: #{user[:email]}, password: #{user[:password]}, role: #{user[:role]}" if(user[:role].to_i == 2 || user[:role].to_i == 3)
        end
		else
        $users.each_with_index do |user,index|
          puts "#{index} -- username: #{user[:username]}, email: #{user[:email]}, password: #{user[:password]}, role: #{user[:role]}" if user[:role].to_i == 3
        end
		end
	end

	def self.addUser(permission)
		puts "-----Add user operation-----"
		if permission.to_i == 1
			puts "Please put username"
			username= gets.chomp
			puts "Please put email"
			email = gets.chomp
			puts "Please put password"
			password = gets.chomp
			puts "Please enter role number"
			role = gets.chomp
			tempUser = { username: username, email: email, password: password, role: role.to_i}
			$users.push(tempUser)
			printAllUsers(permission)
			Menue.manager()
		else
			puts "Please put username"
			username= gets.chomp
			puts "Please put email"
			email = gets.chomp
			puts "Please put password"
			password = gets.chomp
			role = 3
			tempUser = { username: username, email: email, password: password, role: role}
			$users.push(tempUser)
			printAllUsers(permission)
			Menue.staff()
		end
	end

	def self.printUserlog(permission)
		puts "-----Userlog operation-----"
		if permission.to_i == 1
		$userlogs.each_with_index do |userlog,index|
		puts "#{index} -- #{userlog}"
			end
		elsif permission.to_i == 2
		$userlogs.each_with_index do |userlog,index|
		puts "#{index} -- #{userlog}"
			end
		else
		puts "Your permission is not allowed to open this function"
		end
	end


  def self.removeUser(permission)
      puts "-----Remove user operation-----"
      #This is manager side. This shows every single user
    if permission.to_i == 1
      $users.each_with_index do |user,index|
        puts "#{index} -- username: #{user[:username]}, email: #{user[:email]}, password: #{user[:password]}, role: #{user[:role]}"
        puts "Who do you want to remove? Please enter INDEX NUMBER"
        decision = gets.chomp
        $users.delete_at(decision.chomp.to_i)
        printAllUsers(permission)
        Menue.manager()
      end
    #This is for staff side. This shows only staffs and customers.
    elsif permission.to_i == 2
      $users.each_with_index do |user, index|
        puts "#{index} -- username: #{user[:username]}, email: #{user[:email]}, password: #{user[:password]}, role: #{user[:role]}" if(user[:role].to_i == 2 || user[:role].to_i == 3)
        puts "Who do you want to remove? Please enter INDEX NUMBER"
        decision.to_i = gets.chomp
        $users.delete_at(decision.to_i)
        printAllUsers(permission)
        Menue.staff()
      end
    else
      $users.each_with_index do |user,index|
        puts "#{index} -- username: #{user[:username]}, email: #{user[:email]}, password: #{user[:password]}, role: #{user[:role]}" if user[:role].to_i == 3
      end
    end
  Menue.smenu()
  end
end
