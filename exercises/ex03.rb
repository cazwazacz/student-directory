#defining methods
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    max_length = 12
    if student[:name].length < max_length
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
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

#nothing happens until methods are called
students = input_students
print_header
print(students)
print_footer(students)
