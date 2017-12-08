class UserRepository
  include Repository

  def initialize
    @adapter = User
  end
end