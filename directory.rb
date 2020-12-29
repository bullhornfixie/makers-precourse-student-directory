def input_students
  puts "Please enter student name and then cohort seperated by comma e.g. jon, october"
  puts "To finish, hit enter twice"

  students = []                                     
  
  name_cohort = gets.chomp
 
  while !name_cohort.empty? do  
    name, cohort = name_cohort.split(", ")
    # split name_cohort into 2 variables
    students << {name: name.capitalize, cohort: cohort.to_sym.capitalize}
    # feed these two variables into a hash which is pushed to an array 
    puts students.count < 2 ? "Now we have #{students.count} student" : "Now we have #{students.count} students"
    # tell me student count 
    name_cohort = gets.chomp
    # ask for another student name, cohort 
  end
  students                                          
end 

def print_header
  puts "The Students of Makers Academy"
  puts "-------------"
end

def print_cohort(students)
  value_for_footer = 0 

  if students.count < 1
    puts "empty list!"
  else
    puts "Which cohort is required?"
    input = gets.chomp
    grouping = students.select { |student| student[:cohort] == input.to_sym.capitalize}
    value_for_footer += grouping.count
    grouping.each { |student| puts "#{student[:name]}".ljust(10) + "(#{student[:cohort]} cohort)".center(10) }
  end

  value_for_footer
end

def print_footer(value_for_footer)
  wording = "Overall, we have #{value_for_footer} great student"
  puts value_for_footer < 2 ? wording : wording + "s"
end

students = input_students
print_header 
value_for_footer = print_cohort(students)                             
print_footer(value_for_footer)