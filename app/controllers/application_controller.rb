class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get "/allStudents" do
    students = Student.all.order(:name)
    students.to_json
  end

  get "/allAssignments" do
    assignments = Assignment.all
    assignments.to_json(include: :student)
  end

  post '/new-assignment' do
    newAssignment = Assignment.create(
      student_id: params[:name], 
      title: params[:title], 
      category: params[:category],
      description: params[:description], 
      possible_points: params[:possible_points], 
      earned_points: params[:earned_points],
      due_date: Date.parse(params[:due_date])
    )
    newAssignment.to_json(include: :student)
  end

  post '/new-student' do
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

  delete '/assignments' do
    deleteAssignment = Assignment.find(11)
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
