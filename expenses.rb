$LOAD_PATH << "."
require 'menu'
require 'users'
require 'income'
require 'expenses'
require 'main'

class Expenses
  attr_accessor :expenses,:tempexpenses,:sum,:all

  	def initialize(expenses)
  		@all = all
		@expenses = expenses
		@tempexpenses = tempexpenses
		@sum = sum

	end

def self.addCar(permission)
		puts "-----Add expenses transaction-----"
		puts "Please put description"
		id = gets.chomp
		puts "Please put company id "
		compName = gets.chomp
		puts "Please put the cost"
		mager = gets.chomp.to_i
		puts "Please put the date "
		boss = gets.chomp
		tempexpenses = {id: id, brand: compName, model: mager, seat: boss}
		$expenses.push(tempexpenses)
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
	        $expenses.each_with_index do |car,index|
	        	puts "#{index} --Description: #{car[:id]}, company id: #{car[:brand]}, value: #{car[:model]}, date: #{car[:seat]}"
	        end	
		else
	        $expenses.each_with_index do |car,index|
	        	puts "#{index} --Description: #{car[:id]}, company id: #{car[:brand]}, value: #{car[:model]}, date: #{car[:seat]}"
        	end
		end
	end

	def self.removeCar(permission)
	puts "-----Remove car operation-----"
		if permission.to_i == 1
			puts "Which company you want to remove"
			printAllcars(permission)
			decision = gets.chomp
			$expenses.delete_at(decision.to_i)
			printAllcars(permission)
			Menue.manager()
		else
			puts "Which company you want to remove"
			printAllcars(permission)
			decision = gets.chomp
			$expenses.delete_at(decision.to_i)
			printAllcars(permission)
			Menue.staff()
		end
	end


	def self.exp(permission)
		sum = 0
		if permission.to_i == 1
			$expenses.each_with_index do |car,index|
				sum = sum + (car[:model]).to_i
			end
			puts "Your expenses is: #{sum}"	
		else
			puts "Ya aint have that permission dude!"
        end
	end

	def self.diff(permission)
		all = 0
		sum = 0
        gum = 0

		if permission.to_i == 1
			$expenses.each_with_index do |car,index|
				sum = sum + (car[:model]).to_i
			end
		else
			puts "Ya aint have that permission dude!"
        end

		if permission.to_i == 1
			$income.each_with_index do |car,index|
				gum = gum + (car[:model]).to_i
			end
		else
			puts "Ya aint have a permission dude!"
        end
        all = gum-sum
        puts "next time try to earn more: the differense is: #{all}"
    end





end