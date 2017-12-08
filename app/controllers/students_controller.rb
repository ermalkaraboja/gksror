class StudentsController < ApplicationController

  def index
    #role = Role.find_by_description :Student
    #@students = Array.wrap Student.find_by_role_id role.id

    @students = Array.wrap repo.all.map {|std| std.becomes(Student)}
  end

  private
  def repo
    StudentRepository.new
  end
end
