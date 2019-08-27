$LOAD_PATH << "."
require 'menu'
require 'users'
require 'income'
require 'expenses'
require 'main'

class Car
  attr_accessor :cars,:tempCar,

  	def initialize(cars)
		@cars = cars

	end

def self.addCar(permission)
		puts "-----Add Company-----"
		puts "Please put Company name"
		compName = gets.chomp
		puts "Please put what Company do name"
		mager = gets.chomp
		puts "Please put the Boss name"
		boss = gets.chomp
		tempCar = { brand: compName, model: mager, seat: boss, av: 1}
		$cars.push(tempCar)
		puts "========"
		printAllcars(permission)

		puts "Add more companes : Press 1, Quit adding: Press 0"
		decision = gets.chomp
		if decision.to_i == 1
			return addCar(permission)
		else
      if permission.to_i == 1
        return Menue.manager()
      else
        return Menue.staff()
      end
		end
	end

	def self.printAllcars(permission)
		if permission.to_i == 1
        $cars.each_with_index do |car,index|
          puts "#{index} -- Name: #{car[:brand]}, What company do: #{car[:model]}, Boss: #{car[:seat]}, income: #{car[:av]}"
        end	
		else
        $cars.each_with_index do |car,index|
          puts "#{index} -- Name: #{car[:brand]},  What company do: #{car[:model]}, Boss: #{car[:seat]}, income: #{car[:av]}"
        end
		end
	end

	def self.removeCar(permission)
	puts "-----Remove car operation-----"
		if permission.to_i == 1
			puts "Which company you want to remove"
			printAllcars(permission)
			decision = gets.chomp
			$cars.delete_at(decision.to_i)
			printAllcars(permission)
			Menue.manager()
		else
			puts "Which company you want to remove"
			printAllcars(permission)
			decision = gets.chomp
			$cars.delete_at(decision.to_i)
			printAllcars(permission)
			Menue.staff()
		end
	end
end