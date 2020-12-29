def input_students
  puts "Please enter student name"
  puts "To finish, hit enter twice"

  students = []                                     
  
  name = gets.chop
 
  while !name.empty? do 
    students << {name: name, cohort: :november}
    puts students.count < 2 ? "Now we have #{students.count} student" : "Now we have #{students.count} students"
    name = gets.chop
  end
  
  students                                          
end 

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_cohort(students)
  if students.count < 1
    puts "empty list!"
    # only print list if at least 1 student
  else
    group1 = students.select { |student| student[:cohort] == :november }
    group2 = students.select { |student| student[:cohort] == :october }

    align = lambda { |student| puts "#{student[:name]}".ljust(10) + "(#{student[:cohort]} cohort)".center(10) }

    group1.each(&align)
    group2.each(&align)
  end
end

def print_footer(students)
  wording = "Overall, we have #{students.count} great student"
  puts students.count < 2 ? wording : wording + "s"
end

students = input_students                             
print_header 
print_cohort(students)
print_footer(students)