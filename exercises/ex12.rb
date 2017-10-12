#defining methods
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  if students.length > 0
    students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  else
    puts "There are no students"
  end
end

def print_footer(names)
  if names.length > 0
    puts "Overall, we have #{names.count} great students"
  end
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
