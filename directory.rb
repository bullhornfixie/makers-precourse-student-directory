def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []                                     
  # created empty array 
  name = gets.chomp                                
  # gets the the first name

  while !name.empty? do 
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"    
    # confirms students input 
    name = gets.chomp                                
    # get another name from user 
  end
  
  students                                          
  # return the array of students 
end 

def print_header 
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_cohort(list)
  list.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)" }
end

def print_footer(names) 
  puts "Overall, we have #{names.count} great students"
end

students = input_students                             
# return input_students = students (students is a variable used outside this method)
print_header 
print_cohort(students)
print_footer(students)