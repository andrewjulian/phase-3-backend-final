require "faker"

puts "🌱 Seeding spices..."

# Seed your database here

# Create 5 students (could be refactored with "times")
Student.create(name: "Alex",grade_level: rand(9..12))
Student.create(name: "Andrew",grade_level: rand(9..12))
Student.create(name: "Ashley",grade_level: rand(9..12))
Student.create(name: "Jackie",grade_level: rand(9..12))
Student.create(name: "Richard",grade_level: rand(9..12))

# Create 5 assignments
Student.all.each do |student|
  Assignment.create(student_id: student.id)
end

puts "✅ Done seeding!"
