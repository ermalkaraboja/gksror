class Course < ApplicationRecord
  has_many :assesments
  has_many :usercourse

  has_many :students, :through => :usercourse, foreign_key: :student_id, :class_name => 'User'
  belongs_to :instructor, class_name: 'User', foreign_key: :instructor_id
end
