require 'date'

#dummy info for injecting into method
$dummy_info = [
  {name: 'Allan Wazacz', cohort: :december},
  {name: 'Typical Name', cohort: :december},
  {name: 'Johnny Checz', cohort: :june},
  {name: 'Hello Name', cohort: :may},
  {name: 'Allan Bob', cohort: :may},
  {name: 'Alex Fun', cohort: :june},
  {name: 'Billy Hope', cohort: :december},
  {name: 'Dave Grohl', cohort: :january},
  {name: 'Nate Mendel', cohort: :may},
  {name: 'Chris Shiflett', cohort: :june},
  {name: 'Taylor Hawkins', cohort: :november},
]

#defining methods
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  #go through each month and find students from month
  #then print them
  Date::MONTHNAMES.each do |month|
    month = month.to_s.downcase.to_sym
    students.each do |student|
      if student[:cohort] == month
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
      end
    end
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def input_students
  puts "Please enter the names and cohort months of the students"
  puts "To finish, just hit return twice"
  puts
  #create empty array/insert dummy info
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
    if students.count == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
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
