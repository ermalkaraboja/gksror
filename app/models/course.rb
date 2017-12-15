class Course < ApplicationRecord
  has_many :assesments
  has_many :students,-> {where(:role_id => 2)}, through: :user_courses
end
