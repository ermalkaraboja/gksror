class InstructorRepository
  include Repository

  def initialize
    @adapter = User.Instructor
  end
end