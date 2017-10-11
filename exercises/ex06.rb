#defining methods
def print_header
  puts "The students of Villains Academy".center($line_width)
  puts "-------------------------------".center($line_width)
end

def print(students)
  students.each do |student|
    puts "#{student[:name]}".ljust($line_width/2) + "(#{student[:cohort]} cohort)".rjust($line_width/2)
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create empty array
  students = []
  #get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

#setting line width for centering etc
$line_width = 40

#nothing happens until methods are called
students = input_students
print_header
print(students)
print_footer(students)
