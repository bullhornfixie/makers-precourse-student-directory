def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []                                     
 
  name = gets.chomp
  puts "where was #{name} born"
  origin = gets.chomp 
                                   
  while !name.empty? do 
    students << {name: name, origin: origin, cohort: :november} 
    puts "Now we have #{students.count} students"    

    name = gets.chomp 
    puts "where was #{name} born"
    origin = gets.chomp                              
  end
  
  students                                          
end 

def print_header 
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_cohort(students)
  students.each { |student| puts "#{student[:name]} #{student[:origin]} (#{student[:cohort]} cohort)" }
end

def print_footer(students) 
  puts "Overall, we have #{students.count} great students"
end

students = input_students                             
print_header 
print_cohort(students)
print_footer(students)