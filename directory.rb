def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []                                     
 
  name = gets.chomp                                

  while !name.empty? do 
    students << {name: name, cohort: :november} 
    puts "Now we have #{students.count} students"    
    name = gets.chomp                                
  end
  
  students                                          
end 

def print_header 
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_cohort(students)
  filtered = students.select { |student| student if student[:name][0].include? "T" } 
  # modified program to only print the students whose name begins with a "T"
  filtered.each_with_index { |student, index| puts "#{index + 1} #{student[:name]} (#{student[:cohort]} cohort)" }
end

def print_footer(students) 
  puts "Overall, we have #{students.count} great students"
end

students = input_students                             
print_header 
print_cohort(students)
print_footer(students)