$LOAD_PATH << "."
require 'menu'
require 'users'
require 'income'
require 'expenses'
require 'main'
require 'company'

class Income
  attr_accessor :income,:tempIncome,:sum

  	def initialize(income)
  		@sum = sum
		@income = income
		@tempIncome = tempIncome

	end

def self.addCar(permission)
		puts "-----Add income transaction-----"
		puts "Please put description"
		id = gets.chomp
		puts "Please put company id "
		compName = gets.chomp
		puts "Please put the cost"
		mager = gets.chomp
		puts "Please put the date "
		boss = gets.chomp
		tempIncome = {id: id, brand: compName, model: mager, seat: boss, av: 1}
		$income.push(tempIncome)
		puts "========"
		printAllcars(permission)

		puts "Add more incomes transactions : Press 1, Quit adding: Press 0"
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
        $income.each_with_index do |car,index|
          puts "#{index} --Description: #{car[:id]}, company id: #{car[:brand]}, value: #{car[:model]}, date: #{car[:seat]}, personal transaction id: #{car[:av]}"
        end	
		else
        $income.each_with_index do |car,index|
          puts "#{index} --Description: #{car[:id]}, company id: #{car[:brand]}, value: #{car[:model]}, date: #{car[:seat]}, personal transaction id: #{car[:av]}"
        end
		end
	end

	def self.removeCar(permission)
	puts "-----Remove car operation-----"
		if permission.to_i == 1
			puts "Which company you want to remove"
			printAllcars(permission)
			decision = gets.chomp
			$income.delete_at(decision.to_i)
			printAllcars(permission)
			Menue.manager()
		else
			puts "Which company you want to remove"
			printAllcars(permission)
			decision = gets.chomp
			$income.delete_at(decision.to_i)
			printAllcars(permission)
			Menue.staff()
		end
	end




	def self.exp(permission)
		sum = 0
		if permission.to_i == 1
			$income.each_with_index do |car,index|
				sum = sum + (car[:model]).to_i
			end
			puts "Your expenses is: #{sum}"	
		else
			puts "Ya aint have a permission dude!"
        end
	end




end