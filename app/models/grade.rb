class Grade < ApplicationRecord
  belongs_to :assesment
  #has_one :instructor, :class_name => 'User', source: :user, conditions: 'role_id = 1'
  #has_one :student, :class_name => 'User', source: :user, conditions: 'role_id = 2'
end