class Grade < ApplicationRecord
  belongs_to :assesment
  belongs_to :instructor, :class_name => 'User',  foreign_key: :instructor_id
  belongs_to :student, :class_name => 'User',  foreign_key: :student_id
  #has_one :instructor, :class_name => 'User', source: :user, conditions: 'role_id = 1'
  #has_one :student, :class_name => 'User', source: :user, conditions: 'role_id = 2'
end