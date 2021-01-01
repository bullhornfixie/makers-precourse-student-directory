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
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def process(selection)
  case selection 
    when "1"
      input_students 
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit 
    else
      puts "I dont know what you meant, try again"
    end   
end

def input_students
  puts "Please enter student name and then cohort seperated by comma e.g. jon, october"
  puts "To finish, hit enter twice"                               
        
  name_cohort = STDIN.gets.chomp
       
  while !name_cohort.empty? do  
    name, cohort = name_cohort.split(", ")
    student_entry(name, cohort)
    puts @students.count < 2 ? "Now we have #{@students.count} student" : "Now we have #{@students.count} students"
    name_cohort = STDIN.gets.chomp # input next student from command line (Standard Input aka STDIN)
  end                                       
end

def show_students
  print_header
  print_students_list
  print_footer
end 

def print_header
  puts "The Students of Makers Academy"
  puts "-------------"
end

def print_students_list
  if @students.count < 1
    puts "empty list!"
  else
    puts "Which cohort is required?"
    input = STDIN.gets.chomp
    grouping = @students.select { |student| student[:cohort] == input.to_sym.capitalize}
    @cohort_size = grouping.count
    grouping.each { |student| puts "#{student[:name]}".ljust(10) + "(#{student[:cohort]} cohort)".center(10) }
  end
end

def print_footer
  wording = "In this cohort, we have #{@cohort_size} great student"
  puts @cohort_size < 2 ? wording : wording + "s"
end

def save_students
  file = File.open("students.csv", "w")
 
  @students.each do |student| 
    student_data = [student[:name]],[student[:cohort]] 
    csv_line = student_data.join(",") 
    file.puts csv_line # re-directing standard output to file instead of terminal 
  end
  file.close 
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(",")
    student_entry(name, cohort)
  end
  file.close
end

def try_load_students
  filename = ARGV.first # takes first argument passed via the command line
  return if filename.nil? # exit method if no argument given 
  if File.exists?(filename) # method used on File class
    load_students(filename)
      puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist 
    puts "Sorry, #{filename} doesn't exist."
  end
end

def student_entry(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
  puts "student entry added"
end
  
try_load_students
interactive_menu


