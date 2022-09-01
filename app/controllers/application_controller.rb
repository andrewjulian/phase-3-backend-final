class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get "/students" do
    students = Student.allStudentsByName()
    students.to_json
  end

  get "/assignments" do
    assignments = Assignment.all
    assignments.to_json(include: :student)
  end

  post '/assignments' do
    newAssignment = Assignment.create(
      student_id: params[:studentID], 
      title: params[:title], 
      category: params[:category],
      description: params[:description], 
      possible_points: params[:possible_points], 
      earned_points: params[:earned_points],
      due_date: Date.parse(params[:due_date])
    )
    newAssignment.to_json(include: :student)
  end

  post '/students' do
    newStudent = Student.create(
      name: params[:name],
      grade_level: params[:grade_level]
    )
    newStudent.to_json
  end

  delete '/assignments/:id' do
    deleteAssignment = Assignment.find(params[:id])
    deleteAssignment.destroy
    deleteAssignment.to_json
  end

  patch '/assignments/:id' do
    newScore = Assignment.find(params[:id])
    newScore.update(
      earned_points: params[:earned_points],
    )
    newScore.to_json(include: :student)
  end

end
