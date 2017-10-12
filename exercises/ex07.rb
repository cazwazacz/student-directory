require 'date'

#defining methods
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def input_students
  puts "Please enter the names and cohort months of the students"
  puts "To finish, just hit return twice"
  puts
  #create empty array
  students = []
  #get the name
  puts 'Name:'
  name = gets.chomp
  #get the month
  puts 'Cohort:'
  #cohort = gets.chomp ||= :november
  #while the name is not empty, repeat this code
  while !name.empty? do
    cohort = gets.chomp.capitalize
    cohort == "" ? cohort = :november : cohort = valid_cohort(cohort)
    #add the student hash to the array
    students << {name: name, cohort: cohort.downcase.to_sym}
    puts "Now we have #{students.count} students"
    puts 'Name:'
    name = gets.chomp
    puts 'Cohort:'
  end
  students
end

def valid_cohort(cohort)
  if cohort != ''
    until Date::MONTHNAMES.include? cohort
      puts "Please enter a valid cohort"
      cohort = STDIN.gets.chomp.capitalize
    end
  else
    cohort = :november
  end
  cohort = cohort.to_sym
end

#nothing happens until methods are called
students = input_students
print_header
print(students)
print_footer(students)
