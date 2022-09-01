class Student < ActiveRecord::Base
  has_many :assignments

  def self.allStudentsByName
    Student.all.order(:name)
  end

end