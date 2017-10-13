@students = [] #an empty array accessible to all methods

def interactive_menu
  loop do
    # 1. print the menu and ask the user what do
    print_menu
    # 2. do what the user has asked
    process(STDIN.gets.chomp)
  end
end

def save_students
    #open the file for writing
    file = File.open("students.csv", "w")
    #iterate over the array of students
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(',')
      file.puts csv_line
    end
    file.close
    puts "File saved successfully."
end

def try_load_students
  ARGV.first ? filename = ARGV.first : filename = "students.csv" #automatically load unless file provided
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit #quit the program
  end
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
  puts "File loaded successfully."
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1" then @students = input_students #input students
    when "2" then show_students #show students
    when "3" then save_students
    when "4" then load_students
    when "9" then exit # terminate program
    else
      puts "I don't know what you meant, try again"
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create empty array
  #get the first name
  name = STDIN.gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
  @students
end

try_load_students
interactive_menu
