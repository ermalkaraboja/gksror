class Usercourse < ApplicationRecord
  belongs_to :course, primary_key: :course_id
  belongs_to :instructor, :class_name => 'User',  foreign_key: :instructor_id
  belongs_to :student, :class_name => 'User',  foreign_key: :student_id
end