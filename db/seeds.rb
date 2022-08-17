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
  Assignment.create(student_id: student.id, title: "HW #1", category: "Math", description: "Problems #1 - #10", possible_points: 10, due_date: Faker::Date.between(from: '2022-08-01', to: '2022-08-01'))
end

Student.all.each do |student|
  Assignment.create(student_id: student.id, title: "Reading Assignment #1", category: "English", description: "Read Chapters 1 & 2", possible_points: 5, due_date: Faker::Date.between(from: '2022-08-02', to: '2022-08-02'))
end

puts "✅ Done seeding!"
