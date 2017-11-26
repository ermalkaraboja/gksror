class StudentsController < ActionController::Base

  def show
    #Users.all.select {|x| x.role_id.equal? 2 }
    @students = User.all
  end

end