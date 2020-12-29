def input_students
  puts "Please enter student name: "
  puts "Then enter cohort: "
  puts "To finish, enter quit then return"

  students = []                                     
  
  data = {name: gets.chomp, cohort: gets.chomp.to_sym}

  while !data.empty? do 
    students << data 
    puts students.count < 2 ? "Now we have #{students.count} student" : "Now we have #{students.count} students"
    data = {name: gets.chomp, cohort: gets.chomp.to_sym}
    
    if data[:name] == "quit"
      break
    end
  end
  
  students                                          
end 

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_cohort(students)
  group1 = students.select { |student| student[:cohort] == :november }
  group2 = students.select { |student| student[:cohort] == :october }

  align = lambda { |student| puts "#{student[:name]}".ljust(10) + "(#{student[:cohort]} cohort)".center(10) }

  group1.each(&align)
  group2.each(&align)
end

def print_footer(students)
  wording = "Overall, we have #{students.count} great student"
  puts students.count < 2 ? wording : wording + "s"
end

students = input_students                             
print_header 
print_cohort(students)
print_footer(students)