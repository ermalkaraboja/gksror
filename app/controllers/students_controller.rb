class StudentsController < ApplicationController

  def index
    #role = Role.find_by_description :Student
    #@students = Array.wrap Student.find_by_role_id role.id

    @students = Array.wrap repo.find 2
  end

  private
  def repo
    StudentRepository.new
  end
end
