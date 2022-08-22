class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get "/" do
    students = Students.all.order(:name)
    students.to_json
  end

  post '/students' do
    newStudent = Student.create(
      name: params[:name],
      grade_level: params[:grade_level]
    )
    newStudent.to_json
  end

  post '/assignments' do
    Student.all.each do |student|
      newAssignment = Assignment.create(
        student_id: student.id, 
        title: params[:title], 
        category: params[:category],
        description: params[:description], 
        possible_points: params[:possible_points], 
        due_date: Date.parse(params[:due_date])
      )
      newAssignment.to_json
    end
  end

  delete '/assignment/:id' do
    deleteAssignment = Assignment.find(params[:id])
    deleteAssignment.destroy
    deleteAssignment.to_json
  end

  patch '/student/assignment/:id' do
    updateScore = Assignment.find(params[:id])
    updateScore.update(
      earned_points: params[:earned_points],
    )
    updateScore.to_json
  end

end
