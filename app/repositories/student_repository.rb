class StudentRepository
  include Repository

  def initialize
    @adapter = User.Student
  end
end