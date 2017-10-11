#defining methods
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]}, Country of birth: #{student[:country]}, Height: #{student[:height]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def input_students
  puts "Please enter the name, country of birth"
  puts "and height of the students separated by commas"
  puts "(eg. Ricky, UK, 164cm)"
  puts
  puts "To finish, just hit return twice"
  #create empty array
  students = []
  #get details
  #while the name is not empty, repeat this code
  #split input into array by commas, first index is name, second is country and third is height
  details = gets.chomp
  details_array = details.split(',')
  while !details.empty? do
    #add the student hash to the array
    name = details_array[0]
    country = details_array[1]
    height = details_array[2]
    students << {name: details_array[0], country: country, height: height, cohort: :november}
    puts "Now we have #{students.count} students"
    details = gets.chomp
    details_array = details.split(',')
  end
  students
end

#nothing happens until methods are called
students = input_students
print_header
print(students)
print_footer(students)
