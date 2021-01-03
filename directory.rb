require "csv"
@students = []

def interactive_menu
  loop do 
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
  puts "9. Exit"
end

def process(selection)
  case selection 
    when "1" then input_students 
    when "2" then show_students
    when "3" then save_students
    when "4" then load_students
    when "9" then puts "You have selected option 9: Exit"
      exit 
    else
      puts "I dont know what you meant, try again"
    end   
end

def input_students
  puts "You have selected option 1: Input the students"
  puts "Please enter student name and then cohort seperated by comma e.g. jon, october"
  puts "To finish, hit enter twice"                               
        
  name_cohort = STDIN.gets.chomp
       
  while !name_cohort.empty? do  
    name, cohort = name_cohort.split(", ")
    student_entry(name, cohort)
    puts @students.count < 2 ? "Now we have #{@students.count} student" : "Now we have #{@students.count} students"
    name_cohort = STDIN.gets.chomp 
  end                                       
end

def show_students
  puts "You have selected option 2: Show the students"
  print_header
  print_students_list
  print_footer
end 

def print_header
  puts "The Students of Makers Academy"
  puts "-------------"
end

def print_students_list
  puts @students 
end

def print_footer
  wording = "In this cohort, we have #{@students.size} great student"
  puts @students.size < 2 ? wording : wording + "s"
end

def save_students
  file = CSV.open("students.csv", "w")
 
  @students.each do |student| 
    csv_line = [student]
    file.puts csv_line
  end
 file.close 
 puts "Student file saved"
end

def load_students
  file = CSV.open("students.csv", "r") do |csv_data|
    csv_data.readlines.each { |line| @students << line.join }
    puts "Student list loaded"
  end
end

def student_entry(name, cohort)
  @students << {name: name.capitalize, cohort: cohort.to_sym.capitalize}
end

load_students
interactive_menu


